# app/views/policy_views.py

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from app.models.policy import Policy, Purchase
from app.models.pet import Pet
from app.models.user import User

@login_required
def policy_list(request):
    policies = Policy.objects.all()
    return render(request, 'policy_list.html', {'policies': policies})
import BuyPolicy_chain
@login_required
def buy_policy(request, policy_id):
    if request.method == 'POST':
        pet_id = request.POST.get('pet_id')
        pet = get_object_or_404(Pet, id=pet_id, owner=request.user)
        policy = get_object_or_404(Policy, pk=policy_id)
        # 获取用户名
        username = request.user.username
        # username1="主人用户名："+str(username)
        # petname1 = "宠物名：" + str(pet.name)
        # petspecies1="宠物种类："+str(pet.species)
        # policy_name1="保险名："+str(policy.policy_name)
        # term_years1="保险年限："+str(policy.term_years)+" years"
        username1=str(username)
        petname1 =str(pet.name)
        petspecies1=str(pet.species)
        policy_name1=str(policy.policy_name)
        term_years1=str(policy.term_years)

        print(type(username1))
        print(petname1)
        print(petspecies1)
        print(policy_name1)
        print(term_years1)
        BuyPolicy_chain.BuyPolicy_chain_fun(username1,petname1,petspecies1,policy_name1,term_years1)
        # print("宠物名："+f'{pet.name}')
        # print("宠物种类："+f'{pet.species}')
        # print("保险名："+f'{policy.policy_name}')
        # print("保险年限："+f'{policy.term_years}'+' years')
        # BuyPolicy_chain()
        #print("保险价格："+f'{policy.premium_amount}'+'¥')
        Purchase.objects.create(user=request.user, pet=pet, policy=policy)
        return JsonResponse({'message': '购买成功'})
    return JsonResponse({'message': '请求方法错误'}, status=400)

@login_required
def my_policies(request):
    purchases = Purchase.objects.filter(user=request.user, claimed=False)
    return render(request, 'my_policies.html', {'purchases': purchases})

@login_required
def cancel_policy(request, purchase_id):
    purchase = get_object_or_404(Purchase, pk=purchase_id, user=request.user)
    purchase.delete()
    return JsonResponse({'message': '退保成功'})

@login_required
def claim_policy(request, purchase_id):
    purchase = get_object_or_404(Purchase, pk=purchase_id, user=request.user)
    purchase.claimed = True
    purchase.save()
    return JsonResponse({'message': '索赔成功'})
