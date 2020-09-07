# Generated by Django 3.1 on 2020-09-07 17:42

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CreatePool',
            fields=[
                ('poolId', models.CharField(max_length=255, primary_key=True, serialize=False, unique=True)),
                ('poolName', models.CharField(max_length=255)),
                ('contributionAmount', models.IntegerField()),
                ('deadline', models.DateField()),
                ('poolType', models.CharField(max_length=255)),
                ('totalMember', models.IntegerField()),
                ('joinedMember', models.IntegerField(default=0)),
                ('createdAt', models.DateTimeField(auto_now_add=True)),
                ('startStatus', models.BooleanField(default=False)),
                ('completeStatus', models.BooleanField(default=False)),
                ('poolOwner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='poolowner', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='JoinPool',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('joinedAt', models.DateTimeField(auto_now_add=True)),
                ('memberId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='joinedmember', to=settings.AUTH_USER_MODEL)),
                ('poolId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='joinedpool', to='pool.createpool')),
            ],
        ),
    ]
