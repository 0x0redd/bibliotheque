from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import Etudiant
from .forms import EtudiantForm  # Assuming you have created a form for student registration

def index(request):
    # Example view function to render the index page
    return render(request, 'index.html')

def profile(request):
    context = {}
    return render(request, 'profile.html', context)

def inscription(request):
    if request.method == 'POST':
        form = EtudiantForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('inscription_success')  # Redirect to a success page after registration
    else:
        form = EtudiantForm()
    
    context = {'form': form}
    return render(request, 'inscription and login.html', context)

def inscription_success(request):
    return HttpResponse("Inscription réussie!")  # You can customize this success message
