from django.shortcuts import render, get_object_or_404

from .models import District

def office_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
