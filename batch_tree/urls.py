from django.conf.urls import url
from django.urls import path
from . import views

urlpatterns = [
    url(r'^$', views.tree, name='tree'),
    url(r'^children/(?P<parent_id>[0-9]+)/$', views.fetch_children, name='children'),
    url(r'^node/(?P<node_id>[0-9]+)/$', views.node_details, name='node_details'),
]
