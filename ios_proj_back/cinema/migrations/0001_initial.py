# Generated by Django 4.0 on 2021-12-11 14:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('name_lat', models.CharField(max_length=255)),
                ('time_zone', models.IntegerField(default=0, null=True)),
                ('latitude', models.DecimalField(decimal_places=6, default=0, max_digits=9, null=True)),
                ('longitude', models.DecimalField(decimal_places=6, default=0, max_digits=9, null=True)),
                ('order', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Cinema',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField(null=True)),
                ('features', models.TextField(blank=True, null=True)),
                ('address', models.CharField(blank=True, max_length=255)),
                ('long', models.DecimalField(blank=True, decimal_places=6, max_digits=9, null=True)),
                ('lat', models.DecimalField(blank=True, decimal_places=6, max_digits=9, null=True)),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='cinema.city')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]