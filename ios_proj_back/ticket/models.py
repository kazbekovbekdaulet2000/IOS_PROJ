from django.db import models
from cinema.models import Cinema
from public.models import PublicDate


class Hall(PublicDate):
    hall_no = models.IntegerField()
    cinema = models.ForeignKey(Cinema, on_delete=models.CASCADE, null=True)
    vip = models.BooleanField(default=False)
    threeD = models.BooleanField(default=False)
    dolbyAtmos = models.BooleanField(default=False)
    def __str__(self):
        return f"HALL_NO#{self.hall_no}  {self.cinema.name}"


class Row(models.Model):
    row_no = models.IntegerField()
    hall = models.ForeignKey(Hall, on_delete=models.CASCADE, null=True)


class Seat(models.Model):
    number = models.IntegerField()
    symbol = models.CharField(max_length=1, null=True, blank=True)
    picked = models.BooleanField(default=False)
    price_reg = models.IntegerField()
    price_stud = models.IntegerField()
    empty = models.BooleanField()
    row = models.ForeignKey(
        Row, on_delete=models.CASCADE, related_name="seats")
