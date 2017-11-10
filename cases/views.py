from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from .forms import DistrictForm, BinderForm

def homepage(request):
    return render(request, 'homepage.html', {})

def add_entry(request):
    if request.method == 'GET':
        district_form = DistrictForm(prefix='district')
        binder_form = BinderForm(prefix='binder')

        return render(request, 'add-entry.html', {
            'district_form': district_form,
            'binder_form': binder_form
        })

    elif request.method == 'POST':
        district_form = DistrictForm(request.POST, prefix='district')
        binder_form = BinderForm(request.POST, prefix='binder')

        district_valid = district_form.is_valid()
        binder_valid = binder_form.is_valid()

        if district_valid and binder_valid:
            district_form.save()
            binder_form.save()
            return HttpResponseRedirect('/')

def advanced_search(request):
    return render(request, 'advanced-search.html', {})

def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
