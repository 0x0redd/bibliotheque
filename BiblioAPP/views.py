import io
from tkinter import Image
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from .forms import *
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

    if request.user.is_staff:
        for emp in Emprunt.objects.filter(retourner=False):
            if emp.date_retour_prevue + datetime.timedelta(days=365) < datetime.date.today():
                exemplaire_id = emp.id_exemplaire_id  
                emp.id_etudiant.penalite += 1
                emp.id_etudiant.save()

                try:
                    exemplaire = Exemplaire.objects.get(pk=exemplaire_id)
                    livre = exemplaire.id_livre
                    quantite_avant = livre.quantite  # Quantité de livres avant la suppression
                    exemplaire.delete()  

                    # Vérification si un seul exemplaire disponible
                    nb_exemplaires = Exemplaire.objects.filter(id_livre=livre, etat='disponible').count()
                    if nb_exemplaires == 1:
                        unique_exemplaire = Exemplaire.objects.get(id_livre=livre, etat='disponible')
                        unique_exemplaire.etat = 'Hors-pret'
                        unique_exemplaire.save()

                    # Mise à jour de la quantité du livre si elle n'est pas déjà mise à jour
                    if livre.quantite == quantite_avant:
                        livre.horspret = True
                        livre.quantite = Exemplaire.objects.filter(id_livre=livre).count()
                        livre.save()

                except Exemplaire.DoesNotExist:
                    pass

                emp.delete()
        # for etu in Etudiant.objects.filter(is_staff=0,is_superuser=0):
        #     retard = Emprunt.objects.filter(id_etudiant=etu,date_retour_prevue__lt=datetime.date.today,date_retour_effectif=None).count()
        #     etu.penalite = etu.penalite+retard
        context = {
            'Etudiants':Etudiant.objects.filter(is_staff=0),
            'Reservations':Reservation.objects.all(),
            'Emprunts':Emprunt.objects.filter(retourner=False),
            'historique':Emprunt.objects.all(),
            'Livres':Livre.objects.all().order_by("titre"),
            'Exemplaires':Exemplaire.objects.all(),
            'current_date': datetime.date.today(),
        }
        return render(request, 'dashboard.html', context)
    
    return redirect('index')

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
                'emprunt_count':Emprunt.objects.filter(id_etudiant=request.user,retourner=False).count(),
                'current_date': datetime.date.today(),
            }
            render(request, 'profile.html', context)
        else:
            #data to sent if HE IS ADMIN
            context = {
                'reservation':Reservation.objects.all(),
                'Emprunt':Emprunt.objects.all(),
                'etudiants':Etudiant.objects.filter(is_staff=0,is_superuser=0),
                'count':Reservation.objects.all().count(),
                'current_date': datetime.date.today(),
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
            if((res.all().filter(id_etudiant= request.user).count() + Emprunt.objects.filter(id_etudiant=request.user,retourner=False).count()) <3):
                book = Livre.objects.get(pk= form.cleaned_data["IDlivre"])
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
            quantite=random.randint(1, 4),
            genre=random.choice(genres),
            image=f"static/book/{faker.name()}",
        )
    return HttpResponse(book)

def livre(request):
    form = BookSearchForm(request.GET)
    for b in Livre.objects.all():
        if(Exemplaire.objects.filter(id_livre=b,etat="Disponible").count()<=1):
            b.horspret=True
            b.save()

    books = Livre.objects.all().order_by("titre") # Get all books initially order by title
    if not request.user.is_anonymous:
        count = Reservation.objects.filter(id_etudiant=request.user.id_etudiant).count()
        count1 = Emprunt.objects.filter(id_etudiant=request.user.id_etudiant, retourner=False).count()
        sum = count + count1
    else:
        count=0
        count1=0
        sum = 0
    if form.is_valid():
        query = form.cleaned_data['query']
        books = Livre.objects.filter(titre__icontains=query)  # Filter books by title containing the query
    return render(request, 'livre.html', {'form': form, 'books': books,'Res_count':count,'Emp_count':count1, 'sum':sum})

def annule(request):
    res = request.POST.get('reservation')
    Reservation.objects.filter(id_reservation=res).delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
def valider(request):
    id_reserve = request.POST.get('reservation')
    res = Reservation.objects.get(pk=id_reserve)
    exemplaire=Exemplaire.objects.filter(id_livre=res.id_livre,etat="Disponible").count()
    if(exemplaire > 1):
        exemplaire =Exemplaire.objects.filter(id_livre=res.id_livre,etat="Disponible").first()
        Emprunt.objects.create(id_etudiant=res.id_etudiant,id_exemplaire=exemplaire,date_emprunt=datetime.datetime.now(),date_retour_prevue=datetime.datetime.now()+datetime.timedelta(days=15)).save()

        exemplaire.etat = "Hors-pret"
        exemplaire.save()
        Livre_Reservation.objects.create(id_livre=res.id_livre,id_reservation=res)
        res.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def createExemplaire(request):
    for book in Livre.objects.all():
        if book.quantite>1:
            etat = "Disponible"
            book.horspret=False
        else:
            etat ="Hors-pret"
            book.horspret =True
            
        book.save()
        i = Exemplaire.objects.filter(id_livre=book).count()
        for i in range(book.quantite) :
            Exemplaire.objects.create(id_livre=book,etat=etat,date_achat=datetime.datetime.now())

    return HttpResponse(Livre.objects.all())

def retourner(request):
    id_emprunt = request.POST.get('emprunts')
    emprunt=Emprunt.objects.get(pk=id_emprunt)
    emprunt.date_retour_effectif=datetime.datetime.now()
    emprunt.retourner = 1
    emprunt.id_exemplaire.etat = "Disponible"
    emprunt.id_exemplaire.id_livre.horspret=False
    emprunt.id_exemplaire.save()
    emprunt.id_exemplaire.id_livre.save()
    emprunt.save()
    #Emprunt.objects.filter(id_emprunt=id_emprunt).update(date_retour_effectif=datetime.datetime.now,retourner=True)
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

def create_livre(request):
    if request.method == 'POST':
        form = BookForm(request.POST, request.FILES)
        if form.is_valid():
            # Save the form data to the Livre model
            if(form.cleaned_data['quantite']>1): #detecter automatiquement si il doit etre hors pret ou non
                horspret = False
            else:
                horspret = True

            livre = Livre(
                pk=Livre.objects.count()+1,
                titre=form.cleaned_data['titre'],
                description=form.cleaned_data['description'],
                auteur=form.cleaned_data['auteur'],
                langue=form.cleaned_data['langue'],
                quantite=form.cleaned_data['quantite'],
                genre=form.cleaned_data['genre'],
                image=form.cleaned_data['image'],
                horspret=horspret
            )
            livre.save()
            form.clean()
            for k in range(livre.quantite):
                Exemplaire.objects.create(id_livre=livre,etat="Disponible",date_achat=datetime.datetime.now())
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    else:
        form = BookForm()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
def editbook(request):
    if request.method == 'POST':
        livre = Livre.objects.get(pk=request.POST.get('idlivre'))
        if(request.POST.get('quantite') is not None): #edit quantite
            livre.quantite = request.POST.get('quantite')
            
        if(request.POST.get('horspret') ==None): #edit statut if none mean false 
            livre.horspret = False
        else:
            livre.horspret = request.POST.get('horspret') #else true 
        livre.save()
        i =int(livre.quantite)- Exemplaire.objects.filter(id_livre=livre.id_livre).count() #here is for creating a new exemple of a book 
        for k in range(i):
            Exemplaire.objects.create(id_livre=livre,etat="Disponible",date_achat=datetime.datetime.now())

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
#this is for updating etat of exempalire
def updateExemplaire(request):
    if request.method == 'POST':
        exemplaire = Exemplaire.objects.get(pk=request.POST.get('idexemplaire'))
        exemplaire.etat = request.POST.get('etat')
        exemplaire.save()
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
