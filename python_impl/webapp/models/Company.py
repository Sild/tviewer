from django.db import models


class Meta(object):
    app_label = 'webapp'


class Company(models.Model):
    name = models.CharField(max_length=100)
    comment = models.CharField(max_length=500)
    color = models.CharField(max_length=50)
    created = models.DateTimeField('creation date', auto_now_add=True)

    def __str__(self):
        return "\nname: {}\ncomment: {}\ncolor: {}\ncreated:{}\n"\
            .format(self.name, self.color, self.color, self.created)
