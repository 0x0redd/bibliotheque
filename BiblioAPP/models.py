from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone

class Etudiant(AbstractUser):
    id_etudiant = models.AutoField(auto_created = True,primary_key=True )
    username = models.CharField(unique=True,max_length=150, default='no_name')
    cni = models.CharField(max_length=255 ,unique=True)
    massar = models.CharField(max_length=255,unique=True)
    date_naissance = models.DateField()
    filiere = models.CharField(max_length=255)
    last_login = models.DateTimeField(default=timezone.now)
    penalite = models.IntegerField(default=0)

class Livre(models.Model):
    id_livre = models.AutoField(auto_created = True,primary_key=True)
    titre = models.CharField(max_length=255,unique=True)
    description = models.TextField()
    auteur = models.CharField(max_length=255)
    langue = models.CharField(max_length=50)
    quantite = models.IntegerField()
    genre = models.CharField(max_length=100)
    image = models.ImageField(upload_to='staticfiles/books/')
    horspret = models.BooleanField(default=0)
class Exemplaire(models.Model):
    id_exemplaire = models.AutoField(auto_created = True,primary_key=True)
    id_livre = models.ForeignKey(Livre, on_delete=models.CASCADE)
    etat_choices = [
        ('disponible', 'Disponible'),
        ('hors-pret', 'Hors-pret'),
        ('a_enlever', 'A enlever'),
        ('perdu', 'perdu'),
    ]
    etat = models.CharField(max_length=20, choices=etat_choices)
    date_achat = models.DateField()

class Emprunt(models.Model):
    id_emprunt = models.AutoField(primary_key=True)  
    id_exemplaire = models.ForeignKey(Exemplaire, on_delete=models.CASCADE)
    id_etudiant = models.ForeignKey(Etudiant, on_delete=models.CASCADE)
    date_emprunt = models.DateField()  
    date_retour_prevue = models.DateField() 
    date_retour_effectif = models.DateField(null=True)
    retourner = models.BooleanField(default=False)

class Reservation(models.Model):
    id_reservation = models.AutoField(primary_key=True)  
    id_etudiant = models.ForeignKey(Etudiant, on_delete=models.CASCADE)
    id_livre = models.ForeignKey(Livre, on_delete=models.CASCADE)
    date_reservation = models.DateField() 

class Livre_Reservation(models.Model):
    id_livre = models.ForeignKey(Livre, on_delete=models.CASCADE)
    id_reservation = models.ForeignKey(Reservation, on_delete=models.CASCADE)
    class Meta:
        unique_together = (("id_livre", "id_reservation"),)