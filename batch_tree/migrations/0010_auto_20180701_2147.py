# Generated by Django 2.0.4 on 2018-07-01 21:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('batch_tree', '0009_batch_sequence'),
    ]

    operations = [
        migrations.AlterField(
            model_name='batch',
            name='sequence',
            field=models.CharField(max_length=2500, null=True),
        ),
    ]
