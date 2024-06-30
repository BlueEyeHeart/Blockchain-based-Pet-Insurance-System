# Generated by Django 5.0.4 on 2024-06-05 14:15

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_remove_policy_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='policy',
            name='user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='policies', to=settings.AUTH_USER_MODEL),
        ),
    ]
