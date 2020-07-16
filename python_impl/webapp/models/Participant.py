from django.db import models

from .Company import Company
from .Tender import Tender


class Meta(object):
    app_label = 'webapp'


class Participant(models.Model):
    company = models.ForeignKey(Company, on_delete=models.PROTECT)
    tender = models.ForeignKey(Tender, on_delete=models.PROTECT)
    allowed = models.BooleanField()
    offer = models.DecimalField(max_digits=20, decimal_places=5)
    winner = models.BooleanField()
    comment = models.CharField(max_length=200)
    submit_date = models.DateTimeField()
    reject_date = models.DateTimeField()

    def __str__(self):
        return self.company + self.tender + self.offer + self.winner
