# Generated by Django 5.0.2 on 2024-03-16 15:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('students', '0004_alter_breakdownchart_base_meal_price'),
    ]

    operations = [
        migrations.AlterField(
            model_name='breakdownchart',
            name='total_cost',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='breakdownchart',
            name='total_extras_price',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='breakdownchartextra',
            name='price',
            field=models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True),
        ),
    ]
