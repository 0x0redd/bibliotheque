from django.http import HttpResponse
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from .forms import studentForm,loginForm # Assuming you have created a form for student registration
from .models import Etudiant
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
def index(request):
    # Example view function to render the index page
    return render(request, 'index.html')

def profile(request):
    context = {}
    return render(request, 'profile.html', context)
        
def singup(request):
    return render(request, 'singup.html') 

# def inscription(request):
#     if request.method == 'POST':
#         form = EtudiantForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('inscription_success')  # Redirect to a success page after registration
#     else:
#         form = EtudiantForm()
    
#     context = {'form': form}
#     return render(request, 'singin.html', context)
def inscription(request):
    if request.method == 'POST':
        form = studentForm(request.POST)
        if form.is_valid():
            if form.cleaned_data["password"] != form.cleaned_data["confirmpassword"]:
                context = {
                    'error_message': "le mot de passe n'est pas le même"
                }
                return render(request, 'singin.html', context)
            else:
                student = Etudiant.objects.create(
                    username= form.cleaned_data["nom"]+" "+form.cleaned_data["prenom"],
                    first_name=form.cleaned_data["nom"],
                    last_name=form.cleaned_data["prenom"],
                    is_staff = False,
                    is_superuser = False,
                    cni=form.cleaned_data["cni"],
                    massar=form.cleaned_data["massar"],
                    date_naissance=form.cleaned_data["date_naissance"],
                    password=form.cleaned_data["password"],
                    email=form.cleaned_data["email"],
                    filiere=form.cleaned_data["filiere"]
                )
                login(request, student)
                return redirect('profile')  # Assuming you have a URL named 'profile' configured in your urls.py

    else:  # GET request
        form = studentForm()
    return render(request, 'singin.html', {"form": form})

def user_login(request):
    if request.method == 'POST':
        form = loginForm(request.POST)
        if form.is_valid():
            student = Etudiant.objects.filter(cni=form.cleaned_data["cni"], massar=form.cleaned_data["massar"],password=form.cleaned_data["password"]).first()
            if student is not None:
                login(request, student)
                # Redirect to a success page or some other view
                return render(request, 'profile.html')
            else:
                # Return an invalid login message or render the login page again
                return render(request, 'singup.html', {'error_message': 'Invalid username or password'})
    else:
        form = loginForm()
        return render(request, 'singup.html',{'error_message': ""})
def user_logout(request):
    logout(request)
    # Redirect to the homepage or some other view after logout
    return redirect('singup')



