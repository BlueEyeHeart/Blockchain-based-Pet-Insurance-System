# forms/policy_form.py
# app/forms/policy_forms.py

from django import forms
from app.models.policy import Policy

class PolicyForm(forms.ModelForm):
    class Meta:
        model = Policy
        fields = ['policy_name', 'premium_amount', 'term_years', 'description', 'start_date', 'end_date']
        labels = {
            'policy_name': '保险名称',
            'description': '保险介绍',
            'term_years': '保险年限',
            'premium_amount': '保险价格',
            'start_date': '开始时间',
            'end_date':'结束时间'
        }
