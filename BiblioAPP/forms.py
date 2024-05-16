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
    title = forms.CharField(label='Title', max_length=100, required=False)
    author = forms.CharField(label='Author', max_length=100, required=False)
    language = forms.CharField(label='Language', max_length=50, required=False)
    genre = forms.CharField(label='Genre', max_length=50, required=False)

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

class StudentSearchForm(forms.Form):
    FILTER_CHOICES = [
        ('nom', 'Nom'),
        ('cni', 'CNI'),
        ('cne', 'CNE'),
        ('filiere', 'Filiere')
    ]
    query = forms.CharField(required=False, label='Query', widget=forms.TextInput(attrs={
        'placeholder': 'Article name or keyword...',
        'class': 'bg-gray-100 outline-none'
    }))
    filter = forms.ChoiceField(choices=FILTER_CHOICES, required=False, label='Filter by', widget=forms.Select(attrs={
        'class': 'bg-white border border-gray-300 rounded-md shadow-sm'
    }))

class exemplairesearch(forms.Form):
    query = forms.CharField(required=False, label='Search Query')
    