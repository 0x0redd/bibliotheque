# Generated by Django 5.0.4 on 2024-04-18 17:43

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('BiblioAPP', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Etudiant',
            fields=[
                ('id_etudiant', models.IntegerField(primary_key=True, serialize=False)),
                ('nom', models.CharField(max_length=255)),
                ('prenom', models.CharField(max_length=255)),
                ('cni', models.CharField(max_length=255)),
                ('massar', models.CharField(max_length=255)),
                ('date_naissance', models.DateField()),
                ('email', models.EmailField(max_length=255)),
                ('password', models.CharField(max_length=255)),
                ('filiere', models.CharField(max_length=255)),
            ],
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='IDuser',
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='IDemprunt',
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='IDexemplaire',
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='date_finpret',
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='date_pret',
        ),
        migrations.RemoveField(
            model_name='emprunt',
            name='rendu',
        ),
        migrations.RemoveField(
            model_name='exemplaire',
            name='IDexemplaire',
        ),
        migrations.RemoveField(
            model_name='exemplaire',
            name='IDlivre',
        ),
        migrations.RemoveField(
            model_name='exemplaire',
            name='date_entre',
        ),
        migrations.RemoveField(
            model_name='exemplaire',
            name='disponibilite',
        ),
        migrations.RemoveField(
            model_name='livre',
            name='IDlivres',
        ),
        migrations.RemoveField(
            model_name='livre',
            name='editeur',
        ),
        migrations.RemoveField(
            model_name='livre',
            name='image_couverture',
        ),
        migrations.AddField(
            model_name='emprunt',
            name='date_emprunt',
            field=models.DateField(default='1900-01-01'),
        ),
        migrations.AddField(
            model_name='emprunt',
            name='date_retour_effectif',
            field=models.DateField(default='1900-01-01'),
        ),
        migrations.AddField(
            model_name='emprunt',
            name='date_retour_prevue',
            field=models.DateField(default='1900-01-01'),
        ),
        migrations.AddField(
            model_name='emprunt',
            name='id_emprunt',
            field=models.AutoField(default=1, primary_key=True, serialize=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='emprunt',
            name='id_exemplaire',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='emprunts', to='BiblioAPP.exemplaire'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='exemplaire',
            name='date_achat',
            field=models.DateField(default=1),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='exemplaire',
            name='id_exemplaire',
            field=models.IntegerField(default=1, primary_key=True, serialize=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='exemplaire',
            name='id_livre',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='exemplaires', to='BiblioAPP.livre'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='livre',
            name='id_livre',
            field=models.IntegerField(default=1, primary_key=True, serialize=False),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='livre',
            name='image',
            field=models.ImageField(default=1, upload_to='book_images/'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='livre',
            name='quantite',
            field=models.IntegerField(default=1),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='exemplaire',
            name='etat',
            field=models.CharField(choices=[('disponible', 'Disponible'), ('hors-pret', 'Hors-pret'), ('a_enlever', 'A enlever')], max_length=20),
        ),
        migrations.AlterField(
            model_name='livre',
            name='genre',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='livre',
            name='langue',
            field=models.CharField(max_length=50),
        ),
        migrations.AddField(
            model_name='emprunt',
            name='id_etudiant',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='emprunts', to='BiblioAPP.etudiant'),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id_reservation', models.AutoField(primary_key=True, serialize=False)),
                ('date_reservation', models.DateField(default='2024-01-01')),
                ('id_etudiant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to='BiblioAPP.etudiant')),
                ('id_livre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reservations', to='BiblioAPP.livre')),
            ],
        ),
        migrations.CreateModel(
            name='Livre_Reservation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('id_livre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BiblioAPP.livre')),
                ('id_reservation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='BiblioAPP.reservation')),
            ],
            options={
                'unique_together': {('id_livre', 'id_reservation')},
            },
        ),
        migrations.CreateModel(
            name='Sanction',
            fields=[
                ('id_sanction', models.IntegerField(primary_key=True, serialize=False)),
                ('type_sanction', models.CharField(choices=[('retard', 'Retard'), ('perte', 'Perte')], max_length=10)),
                ('date_sanction', models.DateField()),
                ('montant', models.DecimalField(decimal_places=2, max_digits=10)),
                ('id_etudiant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='sanctions', to='BiblioAPP.etudiant')),
            ],
        ),
        migrations.DeleteModel(
            name='User',
        ),
    ]
