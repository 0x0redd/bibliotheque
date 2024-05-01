from django import forms
from .models import Etudiant

# class EtudiantForm(forms.ModelForm):
#     class Meta:
#         model = Etudiant
#         fields = '__all__'  # Utilisez '__all__' pour inclure tous les champs du modèle
    
class studentForm(forms.Form):
    nom = forms.CharField(label="nom" ,max_length=255)
    prenom = forms.CharField(label="prenom", max_length=255)
    cni = forms.CharField(label="cni", max_length=255)
    massar = forms.CharField(label="massar", max_length=255)
    date_naissance = forms.DateField(label="date_naissance") 
    email = forms.EmailField(label="email", max_length=255)
    password = forms.CharField(label="password", max_length=255)
    confirmpassword = forms.CharField(label="confirmpassword", max_length=255)
    filiere = forms.CharField(label="filiere", max_length=255)
    
class loginForm(forms.Form):
    cni = forms.CharField(label="cni", max_length=255)
    massar = forms.CharField(label="massar", max_length=255)
    password = forms.CharField(label="password", max_length=255)


class BookSearchForm(forms.Form):
    query = forms.CharField(label='Search', max_length=100)
class reservForm(forms.Form):
    IDlivre = forms.IntegerField(label="IDlivre")
class BookForm(forms.Form):
    titre = forms.CharField(label="titre", max_length=100)
    description = forms.CharField(label="description")
    auteur = forms.CharField(label="auteur", max_length=50)
    genre = forms.CharField(label="genre", max_length=50)
    langue = forms.CharField(label="langue", max_length=20)
    quantite = forms.IntegerField(label="quantite")
    image = forms.FileField(label="image",required=False)
