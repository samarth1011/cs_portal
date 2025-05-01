from django.contrib import admin
from django.urls import include, path

from . import views

urlpatterns = [
     path('', views.home, name='home'),
     path('services/company_incorporation', views.company_incorporation, name='company_incorporation'),
     path('services/secretarial-compliance', views.compliance, name='secretarial_compliance'),
     path('services/statutory-certification', views.statutory_certification, name='statutory_certification'),
     path('services/compliance-secretaries', views.compliance_secretaries, name='compliance_secretaries'),
     path('services/bank_services', views.bank_services, name='bank_services'),
     path('services/secreterial_audits', views.secreterial_audits, name='secreterial_audits'),
     path('services/rbi_fema_compliance', views.rbi_fema_compliance, name='rbi_fema_compliance'),
     path('services/corporate_advisory', views.corporate_advisory, name='corporate_advisory'),
      path('services/investment_fundraising', views.investment_fundraising, name='investment_fundraising'),
     
     path('services/other_services', views.other_services, name='other_services'),
     path('services/sexual_harasment', views.sexual_harasment, name='sexual_harasment'),
     path('blog/<slug:slug>/', views.blog_detail, name='blog_detail'),
     path("contact", views.contact_view, name="contact"),

]


