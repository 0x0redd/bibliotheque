from django.db import models

class Livre(models.Model):
    IDlivres = models.BigAutoField(primary_key=True)
    titre = models.CharField(max_length=255)
    description = models.TextField()
    auteur = models.CharField(max_length=255)
    editeur = models.CharField(max_length=255)
    genre = models.CharField(max_length=255)
    langue = models.CharField(max_length=2)
    image_couverture = models.ImageField(upload_to='frontend/public/books/', null=True, blank=True)

class User(models.Model):
    IDuser = models.BigAutoField(primary_key=True)
    nombigint = models.CharField(max_length=255)
    prenom = models.CharField(max_length=255)
    CNI = models.CharField(max_length=255)
    Massar = models.CharField(max_length=255)
    Date_naissance = models.DateField()
    email = models.EmailField()
    password = models.CharField(max_length=255)
    filliere = models.CharField(max_length=255)

class Exemplaire(models.Model):
    IDexemplaire = models.BigAutoField(primary_key=True)
    IDlivre = models.ForeignKey(Livre, on_delete=models.CASCADE)
    date_entre = models.BigIntegerField()
    disponibilite = models.BigIntegerField()
    ETAT_CHOICES = [
        ('neuf', 'Neuf'),
        ('abime', 'Abîmé'),
    ]
    etat = models.CharField(max_length=20, choices=ETAT_CHOICES)

class Emprunt(models.Model):
    IDemprunt = models.BigAutoField(primary_key=True)
    IDuser = models.ForeignKey(User, on_delete=models.CASCADE)
    IDexemplaire = models.ForeignKey(Exemplaire, on_delete=models.CASCADE)
    date_pret = models.DateField()
    date_finpret = models.DateField()
    rendu = models.BooleanField(default=0)
