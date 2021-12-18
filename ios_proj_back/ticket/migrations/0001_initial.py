# Generated by Django 4.0 on 2021-12-11 08:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Hall',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('hall_no', models.IntegerField()),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Row',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('row_no', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Seats',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('row_count', models.IntegerField()),
                ('seats_count', models.IntegerField()),
                ('cinema_hall', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ticket.hall')),
            ],
        ),
        migrations.CreateModel(
            name='Seat',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('symbol', models.CharField(blank=True, max_length=1, null=True)),
                ('picked', models.BooleanField(default=False)),
                ('price_reg', models.IntegerField()),
                ('price_stud', models.IntegerField()),
                ('empty', models.BooleanField()),
                ('row', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='seats', to='ticket.row')),
            ],
        ),
        migrations.AddField(
            model_name='row',
            name='seat_map',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='rows', to='ticket.seats'),
        ),
    ]