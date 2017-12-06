from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from .forms import DistrictForm, BinderForm, CaseForm, EventForm, PersonForm
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
        case_valid = case_form.is_valid()
        event_valid = event_form.is_valid()
        victim_valid = victim_form.is_valid()
        suspect_valid = suspect_form.is_valid()

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
        post_copy = request.POST.copy()
        for field in post_copy:
            if post_copy[field] == 'None':
                post_copy[field] = ''
                
        district_form = DistrictForm(post_copy, prefix='district')
        binder_form = BinderForm(post_copy, prefix='binder')
        case_form = CaseForm(post_copy, prefix='case')
        event_form = EventForm(post_copy, prefix='event')
        victim_form = PersonForm(post_copy, prefix='victim')
        suspect_form = PersonForm(post_copy, prefix='suspect')

        if post_copy['case-dr_nbr'] != case_id:
            try:
                case = Case.objects.get(dr_nbr=post_copy['case-dr_nbr'])
                print("Dr Number already exists")
                render(request, '400-bad-request.html', {
                'case_form' : post_copy[case_form],
                })
            except:
                print('Valid Dr')
                case = Case.objects.get(dr_nbr = case_id)
                case.dr_nbr = post_copy['case-dr_nbr']
                for field in case_form.fields:
                    print(case_form[field].value())
                    setattr(case, field, case_form[field].value())
                case.save()
                # for field in case._meta.fields:
                #     setattr(case, field.name, case_form[field.name])
                # case.save()
        else:
            pass



        # case, created = Case.objects.update_or_create(
        # dr_nbr = post_copy['case-dr_nbr'],
        # date_fully_reviewed = post_copy['case-date_fully_reviewed'],
        # court_case_number = post_copy['case-court_case_number'],
        # motive = post_copy['case-motive'],
        # adjudication = post_copy['case-adjudication'],
        # status = post_copy['case-status'],
        # status_date = post_copy['case-status_date'],
        # evidence_destroyed = post_copy['case-evidence_destroyed'],
        # notes = post_copy['case-notes'],
        # )

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

        # if district_valid and case_valid:
        #     case = get_object_or_404(Case, dr_nbr = case_id)
        #     district = get_object_or_404(District, id = case.district.id)
        #     for field in case:
        #         print(field)
        #         case[field] = case_form[field]


        return HttpResponseRedirect('/detail/' + case.dr_nbr)


def advanced_search(request):
    return render(request, 'advanced-search.html', {})

def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
