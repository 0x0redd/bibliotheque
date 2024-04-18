# Generated by Django 5.0.4 on 2024-04-15 22:34

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Livre',
            fields=[
                ('IDlivres', models.BigAutoField(primary_key=True, serialize=False)),
                ('titre', models.CharField(max_length=255)),
                ('description', models.TextField()),
                ('auteur', models.CharField(max_length=255)),
                ('editeur', models.CharField(max_length=255)),
                ('genre', models.CharField(max_length=255)),
                ('langue', models.CharField(max_length=2)),
                ('image_couverture', models.ImageField(blank=True, null=True, upload_to='frontend/public/books/')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('IDuser', models.BigAutoField(primary_key=True, serialize=False)),
                ('nombigint', models.CharField(max_length=255)),
                ('prenom', models.CharField(max_length=255)),
                ('CNI', models.CharField(max_length=255)),
                ('Massar', models.CharField(max_length=255)),
                ('Date_naissance', models.DateField()),
                ('email', models.EmailField(max_length=254)),
                ('password', models.CharField(max_length=255)),
                ('filliere', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Exemplaire',
            fields=[
                ('IDexemplaire', models.BigAutoField(primary_key=True, serialize=False)),
                ('date_entre', models.BigIntegerField()),
                ('disponibilite', models.BigIntegerField()),
                ('etat', models.CharField(choices=[('neuf', 'Neuf'), ('abime', 'Abîmé')], max_length=20)),
                ('IDlivre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BiblioAPP.livre')),
            ],
        ),
        migrations.CreateModel(
            name='Emprunt',
            fields=[
                ('IDemprunt', models.BigAutoField(primary_key=True, serialize=False)),
                ('date_pret', models.DateField()),
                ('date_finpret', models.DateField()),
                ('rendu', models.BooleanField(default=0)),
                ('IDexemplaire', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BiblioAPP.exemplaire')),
                ('IDuser', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BiblioAPP.user')),
            ],
        ),
    ]