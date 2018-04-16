from django.urls import reverse
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from datetime import datetime
from django.views.generic.base import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import *
from abc import abstractmethod
from django.contrib import messages
from django.contrib.auth.decorators import login_required


class UserOnExperimentView(TemplateView):
    def get(self, request, *args, **kwargs):
        user_subject = UserSubject.objects.get(user__id=request.user.id)
        # usuario encerrou o experimento, nao mostra nada
        if not user_subject.on_experiment:
            return HttpResponseRedirect(reverse('the_end'))
        return super().get(request, args, kwargs)


def can_finish(user):
    batches = Batch.objects.all()
    feedbacks = BatchFeedback.objects.filter(user=user).all()
    return len(batches) == len(feedbacks)


class Index(LoginRequiredMixin, UserOnExperimentView):
    template_name = 'recommendations/index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data()
        context['user'] = self.request.user
        data = []
        batches = Batch.objects.all()
        for batch in batches:
            data.append({'batch': batch, 'feedback': batch.feedback(self.request.user)})
        context['data'] = data
        context['can_finish'] = can_finish(self.request.user)
        return context


class BatchView(LoginRequiredMixin, UserOnExperimentView):
    template_name = 'recommendations/batch.html'

    def get_context_data(self, **kwargs):
        batch = get_object_or_404(Batch, pk=self.kwargs['batch_id'])
        context = super().get_context_data()
        context['user'] = self.request.user
        context['batch'] = batch
        context['refactorings'] = Refactoring.objects.filter(batch=batch).order_by('order')
        exists = BatchFeedback.objects.filter(batch=batch, user=self.request.user).exists()
        if exists:
            context['feedback'] = BatchFeedback.objects.filter(batch=batch, user=self.request.user).get()
        return context


@login_required
def save_batch_feedback(request, batch_id):
    user_subject = UserSubject.objects.get(user__id=request.user.id)
    # usuario encerrou o experimento, nao mostra nada
    if not user_subject.on_experiment:
        return HttpResponseRedirect(reverse('the_end'))

    batch = get_object_or_404(Batch, pk=batch_id)

    exists = BatchFeedback.objects.filter(batch=batch, user=request.user).exists()
    if exists:
        feedback = BatchFeedback.objects.filter(batch=batch, user=request.user).get()
    else:
        feedback = BatchFeedback()
        feedback.user = request.user
        feedback.batch = batch

    improved = request.POST.get('improved', None)
    observations = request.POST.get('observations', None)
    if improved is None:
        messages.add_message(request, messages.ERROR, 'Marque sim ou não no formulário')
        context = {'batch': batch}
        return render(request, 'recommendations/batch.html', context)

    feedback.is_positive = improved
    feedback.observations = observations
    feedback.save()
    messages.add_message(request, messages.SUCCESS, 'Resposta salva com sucesso')

    return HttpResponseRedirect(reverse('index'))


@login_required
def finish(request):
    if not can_finish(request.user):
        return HttpResponseRedirect(reverse('cannot'))

    subject = UserSubject.objects.get(user__id=request.user.id)
    subject.on_experiment = False
    subject.save()
    return HttpResponseRedirect(reverse('the_end'))


@login_required
def cannot(request):
    return render(request, 'recommendations/cannot.html')


@login_required
def confirmation(request):
    return render(request, 'recommendations/confirmation.html')


@login_required
def the_end(request):
    return render(request, 'recommendations/the_end.html')