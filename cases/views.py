from django.shortcuts import render, get_object_or_404

from .models import Office

def index(request):
    return render(request, 'index.html',{})

def office_detail(request, office_id):
    office = get_object_or_404(Office, id=office_id)
    return render(request, 'office/detail.html', {'office': office})
