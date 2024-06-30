# claim.py
from django.db import models
from .policy import Policy

class Claim(models.Model):
    policy = models.ForeignKey(Policy, on_delete=models.CASCADE, related_name='claims')
    date = models.DateField()
    description = models.TextField()
    status = models.CharField(max_length=20, choices=(('Submitted', 'Submitted'), ('Reviewed', 'Reviewed'), ('Approved', 'Approved'), ('Rejected', 'Rejected')))

    def __str__(self):
        return f"Claim on {self.policy.name} - Status: {self.status}"
