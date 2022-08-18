from django.contrib.auth.models import User
from django.db import models
from cinema.models import Cinema

from public.models import PublicDate
from ticket.models import Hall, Row, Seat

# Create your models here.

class Reservation(PublicDate):
    cinema = models.ForeignKey(Cinema, on_delete=models.CASCADE, null=False)
    hall = models.ForeignKey(Hall, on_delete=models.CASCADE, null=False)
    row = models.ForeignKey(Row, on_delete=models.CASCADE, null=False)
    seat = models.ForeignKey(Seat, on_delete=models.CASCADE, null=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=False)

    def __str__(self):
        return f"user -{self.user.id}({self.cinema.name} - hall: {self.hall.id}, row:{self.row.id}, seat:{self.seat.id})"