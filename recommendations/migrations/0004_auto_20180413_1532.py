# Generated by Django 2.0.4 on 2018-04-13 15:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('recommendations', '0003_auto_20180413_1530'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sourcefile',
            name='refactoring',
        ),
        migrations.AddField(
            model_name='sourcefile',
            name='name',
            field=models.CharField(default='', max_length=50, unique=True),
            preserve_default=False,
        ),
    ]
