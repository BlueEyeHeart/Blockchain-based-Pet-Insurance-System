from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    # 登录后可补充的额外信息
    address = models.CharField(max_length=255, blank=True, null=True, verbose_name='详细地址')
    full_name = models.CharField(max_length=150, blank=True, null=True, verbose_name='姓名')
    gender = models.CharField(max_length=10, choices=(('male', '男'), ('female', '女')), blank=True, null=True, verbose_name='性别')
    phone_number = models.CharField(max_length=15, blank=True, null=True, verbose_name='电话号码')

    def __str__(self):
        return self.username
