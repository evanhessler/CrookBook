from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'office/(?P<district_id>[0-9]+)/', views.office_detail, name='office_detail'),
]
