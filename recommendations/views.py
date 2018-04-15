from django.urls import reverse
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from datetime import datetime
from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import *
from abc import abstractmethod
from django.contrib import messages
from django.views.generic.edit import FormView


class Index(LoginRequiredMixin, TemplateView):
    template_name = 'recommendations/index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data()
        context['user'] = self.request.user
        context['batches'] = Batch.objects.all()
        return context


class BatchView(LoginRequiredMixin, TemplateView):
    template_name = 'recommendations/batch.html'

    def get_context_data(self, **kwargs):
        batch = get_object_or_404(Batch, pk=self.kwargs['batch_id'])
        context = super().get_context_data()
        context['user'] = self.request.user
        context['batch'] = batch
        context['refactorings'] = Refactoring.objects.filter(batch=batch).order_by('order')
        return context
