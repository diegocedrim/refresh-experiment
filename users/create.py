import sys
import os
import django
import csv
import string
import random

sys.path.append("../")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "refresh_experiment.settings")
django.setup()

from recommendations.models import *


def get_new_password(length):
    alphabet = string.ascii_letters + string.digits
    password = ""
    for i in range(length):
        password += random.choice(alphabet)
    return password


with open("users_to_create.csv") as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        names = row['name'].strip().split()
        user = User(
            first_name=names[0],
            last_name=names[-1],
            username=row['username']
        )
        password = get_new_password(20)
        user.set_password(password)
        user.save()

        subject = UserSubject(
            user=user,
            on_experiment=True
        )
        subject.save()

        print("Url: http://refresh.diegocedrim.com/")
        print("Username: ", user.username)
        print("Password: ", password)
        print()
