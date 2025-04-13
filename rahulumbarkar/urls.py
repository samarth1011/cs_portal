from django.contrib import admin
from django.urls import include, path

from cs_portal.rahulumbarkar import views

urlpatterns = [
     path('', views.home, name='home'),
]
