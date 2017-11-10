from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.homepage, name='homepage'),
    url(r'add', views.add_entry, name='add_entry'),
    url(r'advancedSearch', views.advanced_search, name='advanced_search'),
    url(r'office/(?P<district_id>[0-9]+)/', views.district_detail, name='district_detail'),
]
