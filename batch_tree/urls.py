from django.conf.urls import url
from django.urls import path
from . import views

urlpatterns = [
    url(r'^$', views.tree, name='tree'),
    url(r'^children/(?P<parent_id>[0-9]+)/$', views.fetch_children, name='children'),
]
#     path(r'<int:batch_id>/', views.BatchView.as_view(), name='details'),
#     path(r'<int:batch_id>/save/', views.save_batch_feedback, name='save_batch_feedback'),
#     url(r'^the_end/$', views.the_end, name='the_end'),
#     url(r'^finish/$', views.finish, name='finish'),
#     url(r'^confirmation/$', views.confirmation, name='confirmation'),
#     url(r'^cannot/$', views.cannot, name='cannot'),
#     url(r'^welcome/$', views.welcome, name='welcome'),
# ]
