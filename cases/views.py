from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from .forms import DistrictForm, BinderForm, CaseForm, EventForm, VictimFormset, SuspectFormset
from .models import District, Binder, Case, Event, Person

def homepage(request):
    cases = Case.objects.all()

    return render(request, 'homepage.html', {'cases': cases})

def add_entry(request):
    if request.method == 'GET':

        district_form = DistrictForm(prefix='district')
        binder_form = BinderForm(prefix='binder')
        case_form = CaseForm(prefix='case')
        event_form = EventForm(prefix='event')
        victim_formset = VictimFormset(prefix='victim')
        suspect_formset = SuspectFormset(prefix='suspect')

        print(victim_formset)

        return render(request, 'add-entry.html', {
            'district_form': district_form,
            'binder_form': binder_form,
            'case_form': case_form,
            'event_form': event_form,
            'victim_formset': victim_formset,
            'suspect_formset': suspect_formset,
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
        case_valid = case_form.is_valid()
        event_valid = event_form.is_valid()
        victim_valid = victim_form.is_valid()
        suspect_valid = suspect_form.is_valid()

        print(district_form.errors)
        print(binder_form.errors)
        print(case_form.errors)
        print(event_form.errors)
        print(victim_form.errors)
        print(suspect_form.errors)

        if district_valid and case_valid:
            victim = victim_form.save()
            suspect = suspect_form.save()
            district = district_form.save()
            binder = binder_form.save()
            case = case_form.save(commit=False)
            event = event_form.save(commit=False)

            case.district = district
            # Need to save case before adding ManyToMany relationships

            case.save()
            if binder_valid:
                case.binders.add(binder)
            if victim_valid:
                case.victims.add(victim)
            if suspect_valid:
                case.suspects.add(suspect)

            if event_valid:
                event.case = case
                event.save()

            return HttpResponseRedirect('/detail/' + case.dr_nbr)

def detail(request, case_id):
    if request.method == 'GET':
        district_form = DistrictForm(prefix='district')
        binder_form = BinderForm(prefix='binder')
        case_form = CaseForm(prefix='case')
        event_form = EventForm(prefix='event')
        victim_form = PersonForm(prefix='victim')
        suspect_form = PersonForm(prefix='suspect')
        case = get_object_or_404(Case,dr_nbr=case_id)
        event = get_object_or_404(Event, case=case)
        print(len(case.binders.all()))
        return render(request, 'detail-entry.html', {

            'district_form': district_form,
            'binder_form': binder_form,
            'case_form': case_form,
            'event_form': event_form,
            'victim_form': victim_form,
            'suspect_form': suspect_form,
            'case': case,
            'event': event,
        })

    elif request.method == 'POST':
        print('f')

    # if request.method == 'GET':
    #     the_case = get_object_or_404(Case, dr_nbr=case_id)
    #     district = the_case.district
    #     binder = the_case.binders
    #     # suspect = the_case.suspects.all()
    #     print(the_case.suspects)
    #     event = get_object_or_404(Event, case=the_case)
    #     return render(request, 'detail-entry.html', {
    #         'case_form': the_case,
    #         'district_form': district,
    #         'binder_form': binder,
    #         'event_form': event,
    #         'suspect_form': suspect,
    #     })
    # elif request.method == 'POST':
    #     print('hey')
    #

def advanced_search(request):
    return render(request, 'advanced-search.html', {})

def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
