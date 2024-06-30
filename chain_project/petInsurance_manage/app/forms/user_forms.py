# forms/user_form.py
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError

from app.models import Profile

User = get_user_model()


class RegistrationForm(UserCreationForm):
    email = forms.EmailField(max_length=254, help_text='必填。请输入有效的电子邮件地址。')

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError("这个电子邮件地址已经被注册。")
        return email


class ProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=False)
    last_name = forms.CharField(max_length=150, required=False)
    email = forms.EmailField(required=True)

    class Meta:
        model = Profile
        fields = ['first_name', 'last_name', 'email', 'phone_number', 'address', 'age', 'gender']


class UserProfileForm(forms.ModelForm):
    first_name = forms.CharField(max_length=30, required=False, label='姓名')
    last_name = forms.CharField(max_length=150, required=False, label='姓氏')
    email = forms.EmailField(required=True, label='邮箱')
    phone_number = forms.CharField(max_length=20, required=False, label='手机号')
    address = forms.CharField(max_length=255, required=False, label='地址')
    age = forms.IntegerField(required=False, label='年龄')
    gender = forms.CharField(max_length=10, required=False, label='性别')

    class Meta:
        model = Profile
        fields = ['phone_number', 'address', 'age', 'gender', 'first_name', 'last_name', 'email']

    def save(self, commit=True):
        user = self.instance.user
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']
        if commit:
            user.save()
        return super(UserProfileForm, self).save(commit=commit)


def save(self, commit=True):
    user = self.instance.user
    user.first_name = self.cleaned_data['first_name']
    user.last_name = self.cleaned_data['last_name']
    user.email = self.cleaned_data['email']
    user.save()

    profile = super(ProfileForm, self).save(commit=commit)
    return profile
