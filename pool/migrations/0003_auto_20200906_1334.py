# Generated by Django 3.1 on 2020-09-06 08:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pool', '0002_auto_20200903_1536'),
    ]

    operations = [
        migrations.AddField(
            model_name='createpool',
            name='completeStatus',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='createpool',
            name='startStatus',
            field=models.BooleanField(default=False),
        ),
    ]
