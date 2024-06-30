# app/urls.py

from django.urls import path
from app.views import user_views, pet_views, policy_views,contact_views

urlpatterns = [
    path('register/', user_views.register, name='register'),
    path('login/', user_views.user_login, name='login'),
    path('logout/', user_views.user_logout, name='logout'),
    path('dashboard/', user_views.dashboard, name='dashboard'),  # 用户仪表板
    path('profile/', user_views.profile_view, name='profile'),
    path('pets/', pet_views.my_pets, name='my_pets'),
    path('pets/add/', pet_views.add_pet, name='add_pet'),
    path('pets/edit/<int:pet_id>/', pet_views.edit_pet, name='edit_pet'),
    path('pets/delete/<int:pet_id>/', pet_views.delete_pet, name='delete_pet'),
    path('policies/', policy_views.policy_list, name='policy_list'),
    path('policies/buy/<int:policy_id>/', policy_views.buy_policy, name='buy_policy'),
    path('my_policies/', policy_views.my_policies, name='my_policies'),
    path('policies/cancel/<int:purchase_id>/', policy_views.cancel_policy, name='cancel_policy'),
    path('policies/claim/<int:purchase_id>/', policy_views.claim_policy, name='claim_policy'),
    path('contact/',contact_views.contact, name='contact')
]
