from django.db import models
from django.contrib.auth.models import User


class Meta(object):
    app_label = 'webapp'


class Platform(models.Model):
    name = models.CharField(max_length=50, unique=True)
    site = models.URLField(max_length=100, unique=True)
    edited_by = models.ForeignKey(User, on_delete=models.PROTECT)

    def __str__(self):
        return self.name
