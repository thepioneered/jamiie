# Generated by Django 3.0.8 on 2020-08-04 16:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='otp',
            name='otp',
            field=models.CharField(max_length=255, unique=True),
        ),
    ]
