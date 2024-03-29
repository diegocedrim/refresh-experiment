# Generated by Django 2.0.4 on 2018-04-16 01:43

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('recommendations', '0008_auto_20180415_1712'),
    ]

    operations = [
        migrations.CreateModel(
            name='BatchFeedback',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('observations', models.TextField()),
                ('is_positive', models.BooleanField()),
                ('batch', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='feedbacks', to='recommendations.Batch')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
