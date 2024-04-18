from django import forms
from .models import Etudiant

class EtudiantForm(forms.ModelForm):
    class Meta:
        model = Etudiant
        fields = '__all__'  # Utilisez '__all__' pour inclure tous les champs du modèle
