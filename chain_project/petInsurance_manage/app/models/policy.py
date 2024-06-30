# app/models/policy.py

from django.db import models
from django.conf import settings
from django.utils import timezone

class Policy(models.Model):
    policy_name = models.CharField(max_length=100)
    premium_amount = models.DecimalField(max_digits=10, decimal_places=2)
    term_years = models.IntegerField()
    description = models.TextField()
    start_date = models.DateField(default=timezone.now)
    end_date = models.DateField(default=timezone.now)

    def __str__(self):
        return self.policy_name

class Purchase(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='purchases')
    pet = models.ForeignKey('Pet', on_delete=models.CASCADE, related_name='purchases')
    policy = models.ForeignKey(Policy, on_delete=models.CASCADE, related_name='purchases')
    purchase_date = models.DateField(default=timezone.now)
    claimed = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.policy.policy_name} - {self.pet.name}"
