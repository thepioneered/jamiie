# Generated by Django 3.1 on 2020-08-17 12:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pool', '0004_auto_20200817_1410'),
    ]

    operations = [
        migrations.CreateModel(
            name='TestPool',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.CharField(max_length=255, unique=True)),
            ],
        ),
    ]
