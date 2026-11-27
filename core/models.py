from django.db import models
from django.utils import timezone

class Swimmer(models.Model):
    first_name = models.CharField(max_length=32)
    last_name = models.CharField(max_length=32)
    birthday = models.DateField(auto_now=False)
    created = models.DateTimeField(default=timezone.now)
    sex = models.CharField(choices=(( 'F', 'Famale'), ('M', 'Male')))

class Course(models.Model):
    style = models.CharField()
    distance = models.IntegerField()
    


