# Generated by Django 2.0.4 on 2018-04-13 15:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Batch',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='CodeSmell',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Refactoring',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('class_name', models.CharField(max_length=100)),
                ('order', models.IntegerField()),
                ('batch', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='recommendations.Batch')),
            ],
        ),
        migrations.CreateModel(
            name='RefactoringType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='SourceFile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('source_code', models.TextField()),
                ('changes_description', models.TextField()),
            ],
        ),
        migrations.AddField(
            model_name='refactoring',
            name='changed',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='changed_by', to='recommendations.SourceFile'),
        ),
        migrations.AddField(
            model_name='refactoring',
            name='produced',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='produced_by', to='recommendations.SourceFile'),
        ),
        migrations.AddField(
            model_name='refactoring',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='recommendations.RefactoringType'),
        ),
        migrations.AddField(
            model_name='batch',
            name='removed_smell',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='recommendations.CodeSmell'),
        ),
        migrations.AlterUniqueTogether(
            name='refactoring',
            unique_together={('batch', 'order')},
        ),
    ]