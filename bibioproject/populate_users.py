from django.core.management.base import BaseCommand
from BiblioAPP.User import User

class Command(BaseCommand):
    help = 'Populate users in the database'

    def handle(self, *args, **kwargs):
        user1 = User.objects.create(nombigint='Tobias', prenom='Refsnes', CNI='123456789', Massar='ABC123', Date_naissance='1990-01-01', email='tobias@example.com', password='password123', filliere='Computer Science')
        user2 = User.objects.create(nombigint='Linus', prenom='Refsnes', CNI='123456789', Massar='DEF456', Date_naissance='1991-02-02', email='linus@example.com', password='password456', filliere='Engineering')
        user3 = User.objects.create(nombigint='Lene', prenom='Refsnes', CNI='123456789', Massar='GHI789', Date_naissance='1992-03-03', email='lene@example.com', password='password789', filliere='Mathematics')
        user4 = User.objects.create(nombigint='Stale', prenom='Refsnes', CNI='123456789', Massar='JKL012', Date_naissance='1993-04-04', email='stale@example.com', password='password012', filliere='Physics')
        user5 = User.objects.create(nombigint='Jane', prenom='Doe', CNI='987654321', Massar='MNO345', Date_naissance='1994-05-05', email='jane@example.com', password='password345', filliere='Chemistry')
        self.stdout.write(self.style.SUCCESS('Users added successfully'))
