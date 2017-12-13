from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from .forms import DistrictForm, BinderForm, CaseForm, EventForm, VictimFormset, SuspectFormset, BinderFormset
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

        return render(request, 'add-entry.html', {
            'district_form': district_form,
            'binder_form': binder_form,
            'case_form': {},
            'event_form': event_form,
            'victim_formset': victim_formset,
            'suspect_formset': suspect_formset,
        })

    elif request.method == 'POST':
        district_form = DistrictForm(request.POST, prefix='district')
        binder_form = BinderForm(request.POST, prefix='binder')
        case_form = CaseForm(request.POST, prefix='case')
        event_form = EventForm(request.POST, prefix='event')
        victim_formset = VictimFormset(request.POST, prefix='victim')
        suspect_formset = SuspectFormset(request.POST, prefix='suspect')

        district_valid = district_form.is_valid()
        binder_valid = binder_form.is_valid()
        case_valid = case_form.is_valid()
        event_valid = event_form.is_valid()
        victims_valid = victim_formset.is_valid()
        suspects_valid = suspect_formset.is_valid()

        print(district_form.errors)
        print(binder_form.errors)
        print(case_form.errors)
        print(event_form.errors)
        print(victim_formset.errors)
        print(suspect_formset.errors)


        if not (district_valid and binder_valid and case_valid and event_valid and victims_valid and suspects_valid):
            return render(request, 'add-entry.html', {
            'district_form': district_form,
            'binder_form': binder_form,
            'case_form': case_form.cleaned_data,
            'event_form': event_form,
            'victim_formset': victim_formset,
            'suspect_formset': suspect_formset,
            'district_form_errors': district_form.errors,
            'case_form_errors': case_form.errors,
            'binder_form_errors': binder_form.errors
        })

        if district_valid and case_valid:
            district = district_form.save()
            case = case_form.save(commit=False)
            binder = binder_form.save()
            event = event_form.save(commit=False)

            case.district = district

            # Need to save case before adding ManyToMany relationships
            case.save()

            if binder_valid:
                case.binders.add(binder)
            if victims_valid:
                for victim in victim_formset:
                    victim = victim.save()
                    case.victims.add(victim)
            if suspects_valid:
                for suspect in suspect_formset:
                    suspect = suspect.save()
                    case.suspects.add(suspect)
            if event_valid:
                event.case = case
                event.save()

            return HttpResponseRedirect('/detail/' + case.dr_nbr)

def detail(request, case_id):
    case = get_object_or_404(Case, dr_nbr=case_id)
    district = District.objects.get(id=case.district.id)
    binders = case.binders.all().values()
    victims = case.victims.all().values()
    suspects = case.suspects.all().values()
    event = case.events.get()

    if request.method == 'GET':
        district_form = DistrictForm(prefix='district', instance=district)
        binder_formset = BinderFormset(prefix='binder', initial=binders)
        case_form = CaseForm(prefix='case', instance=case)
        event_form = EventForm(prefix='event', instance=event)
        victim_formset = VictimFormset(prefix='victim', initial=victims)
        suspect_formset = SuspectFormset(prefix='suspect', initial=suspects)

        return render(request, 'detail-entry.html', {
            'district_form': district_form,
            'binder_formset': binder_formset,
            'existing_binders': list(binders),
            'case_form': case_form,
            'event_form': event_form,
            'victim_formset': victim_formset,
            'existing_victims': list(victims),
            'suspect_formset': suspect_formset,
            'existing_suspects': list(suspects),
        })

    elif request.method == 'POST':
        district_form = DistrictForm(request.POST, prefix='district', instance=district)
        binder_formset = BinderFormset(request.POST, prefix='binder', initial=binders)
        case_form = CaseForm(request.POST, prefix='case', instance=case)
        event_form = EventForm(request.POST, prefix='event', instance=event)
        victim_formset = VictimFormset(request.POST, prefix='victim', initial=victims)
        suspect_formset = SuspectFormset(request.POST, prefix='suspect', initial=suspects)

        district_valid = district_form.is_valid()
        binders_valid = binder_formset.is_valid()
        case_valid = case_form.is_valid()
        event_valid = event_form.is_valid()
        victims_valid = victim_formset.is_valid()
        suspects_valid = suspect_formset.is_valid()

        print(district_form.errors)
        print(binder_formset.errors)
        print(case_form.errors)
        print(event_form.errors)
        print(victim_formset.errors)
        print(suspect_formset.errors)

        if district_valid and case_valid:
            case_form.save()
            district_form.save()
            event_form.save()

            if binders_valid:
                binder_formset.save()
            if victims_valid:
                victim_formset.save()
            if suspects_valid:
                suspect_formset.save()

            return HttpResponseRedirect('/detail/' + case.dr_nbr)

def advanced_search(request):
    if request.method == 'GET':
        district_form = DistrictForm(prefix='district')
        binder_form = BinderForm(prefix='binder')
        case_form = CaseForm(prefix='case')
        event_form = EventForm(prefix='event')
        victim_formset = VictimFormset(prefix='victim')
        suspect_formset = SuspectFormset(prefix='suspect')


        return render(request, 'advanced-search.html', {
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
        victim_formset = VictimFormset(request.POST, prefix='victim')
        suspect_formset = SuspectFormset(request.POST, prefix='suspect')

        def getQualifier(qualifier):
            return request.POST.get(qualifier)

        cases = Case.objects.all()
        queryHeading = [];

        print("original length ", len(cases))

        for field in case_form.fields:
            value = case_form[field].value()
            if value not in {'', False, None}:
                if field in {'date_fully_reviewed', 'status_date'}:
                    qualifier = getQualifier('case_' + field + '_qualifier')
                    queryHeading.append(field.replace('_', ' ') + ' is ' + qualifier + ' ' + value)
                    if qualifier == 'before':
                        filterQuery = {field + '__range': ['1900-01-01', value]}
                    elif qualifier == 'after':
                        filterQuery = {field + '__range': [value, '2500-01-01']}
                    else:
                        filterQuery = {field : value}
                else:
                    queryHeading.append(field.replace('_', ' ') + ' is ' + value)
                    filterQuery = {field : value}

                cases = cases.filter(**filterQuery)

        print("length ", len(cases))

        for field in binder_form.fields:
            value = binder_form[field].value()
            if value not in {'', False, None}:
                if field in {'check_out_date'}:
                    qualifier = getQualifier('binder_' + field + '_qualifier')
                    queryHeading.append(field.replace('_', ' ') + ' is ' + qualifier + ' ' + value)
                    filterQuery = dict()

                    if qualifier == 'before':
                        filterQuery = {'binders__' + field + '__range': ['1900-01-01', value]}
                    elif qualifier == 'after':
                        filterQuery = {'binders__' + field + '__range': [value, '2500-01-01']}
                    else:
                        filterQuery = {'binders__' + field : value}
                else:
                    queryHeading.append(field.replace('_', ' ') + ' is ' + value)
                    filterQuery = {'binders__' + field : value}

                cases = cases.filter(**filterQuery)

        print("length ", len(cases))

        for field in district_form.fields:
            value = district_form[field].value()
            if value not in {'', False, None}:
                queryHeading.append('district ' + field.replace('_', ' ') + ' is ' + value)
                filterQuery = dict()
                filterQuery['district__' + field] = value
                cases = cases.filter(**filterQuery)

        print("length ", len(cases))

        for field in event_form.fields:
            value = event_form[field].value()
            if value not in {'', False, None, 'M'}:
                if field in {'date_occurred', 'date_reported'}:
                    qualifier = getQualifier('event_' + field + '_qualifier')
                    queryHeading.append(field.replace('_', ' ') + ' is ' + qualifier + ' ' + value)
                    filterQuery = dict()

                    if qualifier == 'before':
                        filterQuery = {'events__' + field + '__range': ['1900-01-01', value]}
                    elif qualifier == 'after':
                        filterQuery = {'events__' + field + '__range': [value, '2500-01-01']}
                    else:
                        filterQuery = {'events__' + field : value}
                else:
                    queryHeading.append(field.replace('_', ' ') + ' is ' + value)
                    filterQuery = {'events__' + field : value}

                cases = cases.filter(**filterQuery)

        print("length ", len(cases))

        victimIndex = 0
        for victim_form in victim_formset.forms:
            for field in victim_form.fields:
                value = victim_form[field].value()
                if value not in {'', False, None}:
                    if field == 'age':
                        print("HERE ", field, value)
                        qualifier = getQualifier('victim-' + str(victimIndex) + '-age_qualifier')
                        queryHeading.append('victim ' + field.replace('_', ' ') + ' is ' + qualifier + ' ' + value)
                        filterQuery = dict()

                        if qualifier == 'younger than':
                            filterQuery['victims__age__lte'] = value
                        elif qualifier == 'older than':
                            filterQuery['victims__age__gte'] = value
                        else:
                            filterQuery['victims__' + field] = value

                    else:
                        queryHeading.append('victim ' + field.replace('_', ' ') + ' is ' + value)
                        filterQuery = dict()
                        filterQuery['victims__' + field] = value

                    cases = cases.filter(**filterQuery)

            victimIndex += 1;

        print("length ", len(cases))

        suspectIndex = 0
        for suspect_form in suspect_formset.forms:
            for field in suspect_form.fields:
                value = suspect_form[field].value()
                if value not in {'', False, None}:
                    if field == 'age':
                        print("HERE ", field, value)
                        qualifier = getQualifier('suspect-' + str(suspectIndex) + '-age_qualifier')
                        queryHeading.append('suspect ' + field.replace('_', ' ') + ' is ' + qualifier + ' ' + value)
                        filterQuery = dict()

                        if qualifier == 'younger than':
                            filterQuery['suspects__age__lte'] = value
                        elif qualifier == 'older than':
                            filterQuery['suspects__age__gte'] = value
                        else:
                            filterQuery['suspects__' + field] = value

                    else:
                        queryHeading.append('suspect ' + field.replace('_', ' ') + ' is ' + value)
                        filterQuery = dict()
                        filterQuery['suspects__' + field] = value

                    cases = cases.filter(**filterQuery)

            suspectIndex += 1;

        print(len(queryHeading))

        if len(queryHeading) > 0:
            queryHeading = "Cases where " + ' and '.join(queryHeading)
        else:
            queryHeading = None

        print("final length ", len(cases), queryHeading)

        return render(request, 'advanced-search-results.html', {
            'cases': cases,
            'queryHeading': queryHeading
        })


def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
