from django.contrib import admin
from . models import BlogPost, NewsletterSubscriber
# Register your models here.

admin.site.register(BlogPost)
admin.site.register(NewsletterSubscriber)
