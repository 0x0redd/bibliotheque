"""
URL configuration for Bibioproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from BiblioAPP.views import * # Import the new view function

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'),
    path('profile/', profile, name='profile'),
    path('Sing-up/', inscription, name='singup'),
    path('Sing-in/', user_login, name='inscription'),# Corrected the path for registration
    path('logout/', user_logout, name='logout'),
    path('reserver/', reservation, name='reserver'),
    path('randbook/',fakeBook,name='randbook'),
    path('livre/', livre, name='livre'),
    path('Annuler/', annule, name='annuler'),
    path('Contact', contact, name='contact'),
    path('dashboard', dashboard, name='dashboard'),
    path('valider/',valider,name='valider'),
    path('exemplaire',createExemplaire,name="createExemplaire"),
    path('retourner/',retourner,name='retourner'),
    path('addlivre/',create_livre,name='addlivre'),
    path('editlivre/',editbook,name='editlivre'),
    path('updateExemplaire/',updateExemplaire,name='updateExemplaire'),
    
    path('dashboard-reservations', dashboard, name='dashboard-reservations'),
    path('dashboard-emprunts', dashboard, name='dashboard'),
    path('dashboard-historique', dashboard, name='dashboard'),
    path('dashboard-livres', dashboard, name='dashboard'),
    path('dashboard-exemplaires', dashboard, name='dashboard'),
    path('dashboard-sanctions', dashboard, name='dashboard'),
    path('dashboard-etudiants', dashboard, name='dashboard'),
    path('dashboard-contact', dashboard, name='dashboard'),
]

# Add static files serving in development mode
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    
