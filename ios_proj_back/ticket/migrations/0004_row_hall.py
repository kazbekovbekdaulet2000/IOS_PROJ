# Generated by Django 4.0 on 2021-12-12 14:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ticket', '0003_remove_row_seat_map_delete_seats'),
    ]

    operations = [
        migrations.AddField(
            model_name='row',
            name='hall',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ticket.hall'),
        ),
    ]