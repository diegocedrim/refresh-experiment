# Generated by Django 2.0.4 on 2018-04-15 17:12

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recommendations', '0007_auto_20180415_1635'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='refactoring',
            name='changed',
        ),
        migrations.RemoveField(
            model_name='refactoring',
            name='produced',
        ),
        migrations.AddField(
            model_name='refactoring',
            name='file',
            field=models.OneToOneField(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='recommendations.SourceFile'),
        ),
    ]