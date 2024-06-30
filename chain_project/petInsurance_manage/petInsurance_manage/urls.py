"""
URL configuration for petInsurance_manage project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# petInsurance_manage/urls.py
# petInsurance_manage/urls.py
from django.contrib import admin
from django.urls import path, include
from app.views.welcome_views import welcome

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', welcome, name='welcome'), # 使用 home 视图作为根URL的处理器
    path('', include('app.urls')),
]
