# Generated by Django 5.0.3 on 2024-03-29 09:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0016_alter_student_options_alter_student_unique_together_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='extraitem',
            name='Date',
            field=models.DateField(null=True),
        ),
        migrations.AddField(
            model_name='extraitem',
            name='Day',
            field=models.CharField(max_length=15, null=True),
        ),
        migrations.AddField(
            model_name='extraitem',
            name='Time',
            field=models.TextField(max_length=15, null=True),
        ),
    ]
