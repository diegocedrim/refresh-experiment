from django.conf.urls import url
from django.urls import path
from . import views

urlpatterns = [
    url(r'^$', views.Index.as_view(), name='index'),
    path('<int:batch_id>/', views.BatchView.as_view(), name='details'),
]