# Generated by Django 4.0 on 2021-12-17 08:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cinema', '0002_rename_lat_cinema_latitude_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cinema',
            name='features',
        ),
        migrations.AddField(
            model_name='cinema',
            name='image_large',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='cinema',
            name='image_small',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
    ]