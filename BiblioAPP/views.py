from django.http import HttpResponse
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from .forms import studentForm,loginForm # Assuming you have created a form for student registration
from .models import Etudiant , Livre
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
#
from django.contrib import messages
from django.core.management.base import BaseCommand
from django.conf import settings
from faker import Faker
import random
import os
from PIL import Image
import io
def index(request):
    # Example view function to render the index page
    books ={
        'books':Livre.objects.all()
    }
    if request.method == 'POST':
        form = loginForm(request.POST)
        if form.is_valid():
            student = Etudiant.objects.filter(cni=form.cleaned_data["cni"], massar=form.cleaned_data["massar"],password=form.cleaned_data["password"]).first()
            if student is not None:
                login(request, student)
                # Redirect to a success page or some other view
                #return render(request, 'profile.html')
                return redirect("profile")
            else:
                # Return an invalid login message or render the login page again
                return render(request, 'index.html', {'error_message': 'Invalid username or password','books':Livre.objects.all()})
                
                #return redirect(request.META.get('HTTP_REFERER', '/'),{'error_message': 'Invalid username or password','books':Livre.objects.all()})
    else:
        form = loginForm()
    
        #return redirect(request.META.get('HTTP_REFERER', '/'))
    if request.method == 'GET':
        form = loginForm()
        return render(request, 'index.html',books)

def profile(request):
    context = {}
    return render(request, 'profile.html', context)

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
    return redirect('singup')


def generate_random_image(self, width=200, height=300):
        # Generates a simple random color image
        img = Image.new("RGB", (width, height), color=(random.randint(0, 255), random.randint(0, 255), random.randint(0, 255)))
        output = io.BytesIO()
        img.save(output, format='PNG')
        return output.getvalue()

def fakeBook(self, *args, **kwargs):
        faker = Faker()
        genres = ["Fiction", "Non-Fiction", "Fantasy", "Sci-Fi", "Mystery", "Romance", "Thriller", "Biography"]
        image_path = os.path.join(settings.BASE_DIR, "staticfiles", "books")

        if not os.path.exists(image_path):
            os.makedirs(image_path)
        for _ in range(10):  # Change 10 to the desired number of books
            title = faker.catch_phrase()
            image_filename = f"{title.replace(' ', '_')}.png"
            image_full_path = os.path.join(image_path, image_filename)

            # Save the generated image to the filesystem
            # with open(image_full_path, "wb") as img_file:
            #     img_file.write(self.generate_random_image())
            
            Livre.objects.create(
                titre=title,
                description=faker.text(),  # Random description
                auteur=faker.name(),
                langue=faker.language_name(),  # Random language name
                quantite=random.randint(1, 100),
                genre=random.choice(genres),
                image=f"static/book/{image_filename}",
            )


