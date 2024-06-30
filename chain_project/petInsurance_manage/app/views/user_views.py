# app/views/user_views.py

from django.contrib.auth import authenticate, login, logout


from django.shortcuts import render, redirect
from django.urls import reverse
from app.forms.user_forms import RegistrationForm, ProfileForm,UserProfileForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from app.models.profile import Profile

import register_chain
def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        username = request.POST['username']
        print("Received username: ", username)  # 调试输出
        email = request.POST['email']
        print("Received email: ", email)
        register_chain.register_chain(username,email)
        if form.is_valid():
            user = form.save()
            return redirect(reverse('login'))  # 假设您有一个名为 'login' 的登录视图
    else:
        form = RegistrationForm()
    return render(request, 'register.html', {'form': form})


def user_login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        print("Received username: ", username)  # 调试输出
        print("Received password: ", password)  # 调试输出
        user = authenticate(request, username=username, password=password)
        print("Authenticated user: ", user)
        if user is not None:
            login(request, user)
            return redirect('dashboard')
        else:
            return render(request, 'login.html', {'error': '用户名或密码不正确'})
    return render(request, 'login.html')

def user_logout(request):
    logout(request)
    return redirect('login')

def dashboard(request):
    if not request.user.is_authenticated:
        return redirect('login')
    return render(request, 'dashboard.html')


@login_required
def profile_view(request):
    try:
        profile = request.user.profile
    except Profile.DoesNotExist:
        Profile.objects.create(user=request.user)
        profile = request.user.profile

    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('profile')  # 重定向到个人中心页面
    else:
        form = UserProfileForm(instance=profile)
        # 将用户的名和姓初始化到表单
        form.initial['first_name'] = request.user.first_name
        form.initial['last_name'] = request.user.last_name
        form.initial['email'] = request.user.email

    return render(request, 'profile.html', {'form': form})

