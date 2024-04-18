from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Etudiant, Livre, Exemplaire, Emprunt, Sanction, Reservation

def index(request):
    # Example view function to render the index page
    return render(request, 'index.html')

def profile(request):
    context = {}
    return render(request, 'profile.html', context)

def etudiant_detail(request, etudiant_id):
    # View function to retrieve and display details of a specific student
    etudiant = get_object_or_404(Etudiant, pk=etudiant_id)
    return render(request, 'etudiant_detail.html', {'etudiant': etudiant})

def livre_detail(request, livre_id):
    # View function to retrieve and display details of a specific book
    livre = get_object_or_404(Livre, pk=livre_id)
    return render(request, 'livre_detail.html', {'livre': livre})

def emprunt_list(request):
    # View function to retrieve and display a list of book borrowings
    emprunts = Emprunt.objects.all()
    return render(request, 'emprunt_list.html', {'emprunts': emprunts})

def reservation_list(request):
    # View function to retrieve and display a list of book reservations
    reservations = Reservation.objects.all()
    return render(request, 'reservation_list.html', {'reservations': reservations})

# Add more view functions as needed for your application