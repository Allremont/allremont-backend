# Generated by Django 3.2.5 on 2021-07-29 09:15

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0002_alter_requestedservice_created_on'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requestedservice',
            name='created_on',
            field=models.DateTimeField(default=datetime.datetime(2021, 7, 29, 9, 15, 5, 985163, tzinfo=utc), verbose_name='Created on'),
        ),
    ]