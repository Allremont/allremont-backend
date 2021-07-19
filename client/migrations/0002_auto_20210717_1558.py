# Generated by Django 3.2.4 on 2021-07-17 09:58

import datetime
from django.db import migrations, models
import django.db.models.deletion
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='worker',
            name='categories',
        ),
        migrations.AlterField(
            model_name='requestedservice',
            name='created_on',
            field=models.DateTimeField(default=datetime.datetime(2021, 7, 17, 9, 58, 39, 707560, tzinfo=utc), verbose_name='Created on'),
        ),
        migrations.AlterField(
            model_name='requestedservice',
            name='workload',
            field=models.IntegerField(default=0, verbose_name='Workload'),
        ),
        migrations.CreateModel(
            name='WorkerPrice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('price', models.IntegerField(default=0, verbose_name='Price')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='client.categories')),
                ('worker', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='worker_price', to='client.worker')),
            ],
        ),
    ]