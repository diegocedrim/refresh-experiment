from django.shortcuts import render
from .models import *
from django.contrib.auth.decorators import login_required


@login_required
def tree(request):
    context = {
        "roots": Node.objects.filter(parent=None).all()
    }
    return render(request, 'batch_tree/tree.html', context=context)


@login_required
def node_details(request, node_id):
    context = {
        "node": Node.objects.get(pk=node_id)
    }

    return render(request, 'batch_tree/node_details.html', context=context)


@login_required
def fetch_children(request, parent_id):
    context = {
        "children": Node.objects.get(pk=parent_id).children.all(),
        "level": request.GET.get("level", 0),
        "next_level": int(request.GET.get("level", 0)) + 1,
        "identers": range(int(request.GET.get("level", 0)))
    }
    return render(request, 'batch_tree/children.html', context=context)
