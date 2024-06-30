# app/views/pet_views.py

from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from app.models.pet import Pet
from app.forms.pet_forms import PetForm

@login_required
def my_pets(request):
    pets = Pet.objects.filter(owner=request.user)
    form = PetForm()
    return render(request, 'my_pets.html', {'pets': pets, 'form': form})

@login_required
def add_pet(request):
    if request.method == 'POST':
        form = PetForm(request.POST)
        if form.is_valid():
            pet = form.save(commit=False)
            pet.owner = request.user
            pet.save()
            return JsonResponse({'message': '宠物添加成功', 'pet': {
                'id': pet.id,
                'name': pet.name,
                'species': pet.species,
                'age': pet.age,
                'gender': pet.gender
            }})
    return JsonResponse({'message': '添加宠物失败'}, status=400)

@login_required
def edit_pet(request, pet_id):
    pet = get_object_or_404(Pet, id=pet_id, owner=request.user)
    if request.method == 'POST':
        form = PetForm(request.POST, instance=pet)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': '宠物信息更新成功', 'pet': {
                'id': pet.id,
                'name': pet.name,
                'species': pet.species,
                'age': pet.age,
                'gender': pet.gender
            }})
    return JsonResponse({'message': '更新宠物信息失败'}, status=400)

@login_required
def delete_pet(request, pet_id):
    pet = get_object_or_404(Pet, id=pet_id, owner=request.user)
    pet.delete()
    return JsonResponse({'message': '宠物删除成功'})
