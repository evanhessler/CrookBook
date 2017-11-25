from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from .forms import DistrictForm, BinderForm, CaseForm, EventForm, PersonForm
from .models import District, Binder, Case, Event

def homepage(request):
    return render(request, 'homepage.html', {})

def add_entry(request):
    if request.method == 'GET':
        district_form = DistrictForm(prefix='district')
        binder_form = BinderForm(prefix='binder')
        case_form = CaseForm(prefix='case')
        event_form = EventForm(prefix='event')
        victim_form = PersonForm(prefix='victim')
        suspect_form = PersonForm(prefix='suspect')


        return render(request, 'add-entry.html', {
            'district_form': district_form,
            'binder_form': binder_form,
            'case_form': case_form,
            'event_form': event_form,
            'victim_form': victim_form,
            'suspect_form': suspect_form,
        })

    elif request.method == 'POST':
        district_form = DistrictForm(request.POST, prefix='district')
        binder_form = BinderForm(request.POST, prefix='binder')
        case_form = CaseForm(request.POST, prefix='case')
        event_form = EventForm(request.POST, prefix='event')
        victim_form = PersonForm(request.POST, prefix='victim')
        suspect_form = PersonForm(request.POST, prefix='suspect')

        district_valid = district_form.is_valid()
        binder_valid = binder_form.is_valid()
        #case_valid = district_form.is_valid()
        if district_valid and binder_valid:
            case_valid = True
        else:
            case_valid = False

        event_valid = event_form.is_valid()
        victim_valid = victim_form.is_valid()
        suspect_valid = suspect_form.is_valid()

        print(district_form.errors)
        print(binder_form.errors)
        print(case_form.errors)
        print(event_form.errors)
        print(victim_form.errors)
        print(suspect_form.errors)

        if district_valid and binder_valid and case_valid:
            district = district_form.save()
            binder = binder_form.save()
            #case = case_form.save(commit=False)
            case = case_form.save(commit=False)
            event = event_form.save(commit=False)
            victim = victim_form.save(commit=False)
            suspect = suspect_form.save(commit=False)

            case.district = district
            case.binder = binder
            # case.binder.add(binder)
            case.save()

            if event_valid:
                event.case = case
                event.save()
            if victim_valid:
                victim.case = case
                victim.save()
            if suspect_valid:
                suspect.case = case
                suspect.save()


            return HttpResponseRedirect('/detail/' + case.dr_nbr)

def detail(request, case_id):
    the_case = get_object_or_404(Case, dr_nbr=case_id)
    district = the_case.district
    binder = the_case.binder
    event = get_object_or_404(Event, case=the_case)
    return render(request, 'detail-entry.html', {
        'case_form': the_case,
        'district_form': district,
        'binder_form': binder,
        'event_form': event
    })

def advanced_search(request):
    return render(request, 'advanced-search.html', {})

def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
