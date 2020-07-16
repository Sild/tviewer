from django.db import models

from .Platform import Platform
from .Company import Company


class Meta(object):
    app_label = 'webapp'


class Tender(models.Model):
    number = models.CharField(max_length=50)
    publisher = models.ForeignKey(Company, on_delete=models.PROTECT)
    platform = models.ForeignKey(Platform, on_delete=models.PROTECT)
    price = models.DecimalField(max_digits=20, decimal_places=5)
    currency = models.CharField(max_length=20, choices=(("usd", "доллары"), ("rub", "рубли")))
    state = models.CharField(max_length=10, choices=(("open", "открыт"), ("cancel", "отменен"), ("close", "закрыт")))
    type = models.CharField(max_length=100)
    nomenclature = models.CharField(max_length=100)
    comment = models.CharField(max_length=200)
    trade_form = models.CharField(max_length=200)
    start_date = models.DateTimeField('publish date')
    end_date = models.DateTimeField('end date')
    liked = models.BooleanField()
    add_date = models.DateTimeField('when tender was added to monitor system')

    def __str__(self):
        return self.question_text
