# forms/pet_form.py
from django.forms import ModelForm
from app.models.pet import Pet

class PetForm(ModelForm):
    class Meta:
        model = Pet
        fields = ['name','species', 'age', 'gender']
        labels = {
            'name':'宠物名称',
            'species': '品种',
            'age': '年龄',
            'gender': '性别'
        }
# app/forms/pet_forms.py

