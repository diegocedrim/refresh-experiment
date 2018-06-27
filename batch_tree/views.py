from django.shortcuts import render
from .models import *


def tree(request):
    context = {
        "roots": Node.objects.filter(parent=None).all()
    }
    return render(request, 'batch_tree/tree.html', context=context)


def fetch_children(request, parent_id):
    context = {
        "children": Node.objects.get(pk=parent_id).children.all(),
        "level": request.GET.get("level", 0),
        "next_level": int(request.GET.get("level", 0)) + 1,
        "identers": range(int(request.GET.get("level", 0)))
    }
    return render(request, 'batch_tree/children.html', context=context)
