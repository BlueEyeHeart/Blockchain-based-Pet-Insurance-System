# Generated by Django 5.0.4 on 2024-06-05 14:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='policy',
            name='user',
        ),
    ]