# Generated by Django 2.0.4 on 2018-04-13 15:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('recommendations', '0002_batch_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='sourcefile',
            name='refactoring',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='recommendations.Refactoring'),
        ),
        migrations.AlterField(
            model_name='refactoring',
            name='changed',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='changed_by', to='recommendations.SourceFile'),
        ),
        migrations.AlterField(
            model_name='refactoring',
            name='produced',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='produced_by', to='recommendations.SourceFile'),
        ),
    ]
