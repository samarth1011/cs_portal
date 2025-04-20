from django.db import models
from ckeditor.fields import RichTextField
from ckeditor_uploader.fields import RichTextUploadingField
class BlogPost(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField(unique=True)
    author = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    content = RichTextUploadingField()  
    image = models.ImageField(upload_to='static/blog_images/')
    category = models.CharField(max_length=100)
    tags = models.CharField(max_length=255)

    def __str__(self):
        return self.title
