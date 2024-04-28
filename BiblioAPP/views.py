import io
from tkinter import Image
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from .forms import *# Assuming you have created a form for student registration
from .models import *
from django.contrib.auth import authenticate, login,logout
#
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core.management.base import BaseCommand
from django.conf import settings
from faker import Faker
import random
import datetime

def contact(request):
    return render(request, 'contact.html')

def dashboard(request):
    num_etudiants = Etudiant.objects.count()
    num_livre = Livre.objects.count()
    num_reservation =  Reservation.objects.count()
    num_emprunt = Emprunt.objects.count()

    context = {
        'num_etudiants': num_etudiants,
        'num_livre': num_livre,
        'num_reservation':  num_reservation,
        'num_emprunt':  num_emprunt,
    }

    return render(request, 'dashboard.html', context)

def index(request):
    # Example view function to render the index page
    books ={
        'books':Livre.objects.all()
    }
    #return redirect(request.META.get('HTTP_REFERER', '/'))
    if request.method == 'GET':
        form = loginForm()
        return render(request, 'index.html',books)
def profile(request):
    if not request.user.is_authenticated:
        return redirect('index')
    if(request.user is not None):
        if(request.user.is_staff == 0):
            #data to sent if is not admin
            context = {
                'reservation':Reservation.objects.filter(id_etudiant=request.user),
                'emprunt':Emprunt.objects.filter(id_etudiant=request.user),
                'count':Reservation.objects.filter(id_etudiant=request.user).count(),
            }
            render(request, 'profile.html', context)
        else:
            #data to sent if HE IS ADMIN
            context = {
                'reservation':Reservation.objects.all(),
                'Emprunt':Emprunt.objects.all(),
                'etudiants':Etudiant.objects.filter(is_staff=0,is_superuser=0),
                'count':Reservation.objects.all().count(),
            }
        if request.user.is_authenticated:
            return render(request, 'profile.html', context)
    else:
        return redirect('index')
    

@login_required
def reservation(request):
    if request.method == 'POST':
        form=reservForm(request.POST)
        if form.is_valid():
            res= Reservation.objects
            if(res.all().filter(id_etudiant= request.user).count()<=3):
                book = Livre.objects.filter(id_livre= form.cleaned_data["IDlivre"]).first()
                res =Reservation.objects.create(id_etudiant=request.user ,id_livre= book, date_reservation= datetime.datetime.now()).save()
                return redirect('profile')
            else:
                #send message the use alredy have other book
                form = reservForm()
                #return render(request,'livre.html',{'nomore':"Vos avez reservez plus de 3 livre"})
                #redirect("livre").write({'nomore':"Vos avez reservez plus de 3 livre"})
        return redirect('livre')

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
                
                return redirect('profile')
            else:
                # Return an invalid login message or render the login page again
                return render(request, 'singup.html', {'error_message': 'Invalid username or password'})
    else:
        form = loginForm()
        return render(request, 'singup.html',{'error_message': ""})
def user_logout(request):
    logout(request)
    # Redirect to the homepage or some other view after logout
    return redirect('index')


def generate_random_image(self, width=200, height=300):
        # Generates a simple random color image
        img = Image.new("RGB", (width, height), color=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
        output = io.BytesIO()
        img.save(output, format='PNG')
        return output.getvalue()

def fakeBook(self, *args, **kwargs):
    faker = Faker()
    genres = ["Fiction", "Non-Fiction", "Fantasy", "Sci-Fi", "Mystery", "Romance", "Thriller", "Biography"]
    for x in range(20):
        book=Livre.objects.create(
            titre=random.choice(genres)+faker.name(),
            description=faker.text(),  # Random description
            auteur=faker.name(),
            langue=faker.language_name(),  # Random language name
            quantite=random.randint(1, 100),
            genre=random.choice(genres),
            image=f"static/book/{faker.name()}",
        )
    return HttpResponse(book)

def livre(request):
    form = BookSearchForm(request.GET)
    books = Livre.objects.all() # Get all books initially
    if not request.user.is_anonymous:
        count = Reservation.objects.filter(id_etudiant=request.user.id_etudiant).count()
    else:
        count=0
    if form.is_valid():
        query = form.cleaned_data['query']
        books = Livre.objects.filter(titre__icontains=query)  # Filter books by title containing the query
    return render(request, 'livre.html', {'form': form, 'books': books,'count':count})

def annule(request):
    res = request.POST.get('reservation')
    Reservation.objects.filter(id_reservation=res).delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
