from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name = 'index'),
    url(r'office/(?P<office_id>[0-9]+)/', views.office_detail, name='office_detail'),
]
