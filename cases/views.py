from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.core.exceptions import ObjectDoesNotExist


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
            binder = None
            if not binder_valid:
                try:
                    existing_binder = Binder.objects.get(master_dr = request.POST['binder-master_dr'])
                    binder = existing_binder
                    binder_valid = True
                except ObjectDoesNotExist:
                    print('caught exception. should throw 400')
                    return render(request, '400-bad-request.html', {
                        'case_form': case_form,
                        'binder_form': binder_form,
                        'district_form': district_form,
                        'victim_form': victim_form,
                        'suspect_form': suspect_form,
                        'event_form': event_form,
                    })
            else:
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
        return render(request, '400-bad-request.html', {
            'case_form': case_form,
            'binder_form': binder_form,
            'district_form': district_form,
            'victim_form': victim_form,
            'suspect_form': suspect_form,
            'event_form': event_form,
        })

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
        existing_case = get_object_or_404(Case, dr_nbr=case_id)

        district_form = DistrictForm(request.POST, prefix='district')
        binder_form = BinderForm(request.POST, prefix='binder')
        case_form = CaseForm(request.POST, prefix='case')
        event_form = EventForm(request.POST, prefix='event')
        victim_form = PersonForm(request.POST, prefix='victim')
        suspect_form = PersonForm(request.POST, prefix='suspect')

        if request.POST['case-dr_nbr'] != case_id:
            case_valid = case_form.is_valid() #only invalid if it currently exists or is too long
            district_valid = district_form.is_valid()
            binder_valid = binder_form.is_valid()
            event_valid = event_form.is_valid()
            victim_valid = victim_form.is_valid()
            suspect_valid = suspect_form.is_valid()

            existing_district = None
            existing_binder = None

            district_does_exist = False
            binder_does_exist = False

            add_new_district = None
            add_new_binder = False
            case = None
            event = None
            obj_primary_key = None

            # ENSURES IF THE FORM DISTRICT IS VALID.
            # IF NEW, ADD IT TO DB AND CASE, ELSE, ADD THE EXISTING ONE TO CASE
            all_districts = District.objects.all()
            verify = 0
            for obj in all_districts:
                for field in district_form.fields:
                    if getattr(obj, field) == district_form[field].value():
                        verify+=1
                        if verify == 3:
                            district_does_exist = True
                            obj_primary_key = obj.pk
                            break
                    else:
                        district_does_exist = False
                        verify = 0
                        break
                if verify == 3:
                    break

            if verify == 3 and district_does_exist:
                add_new_district = False
            elif not district_does_exist and district_valid and case_valid and verify == 0:
                add_new_district = True

            if add_new_district and district_valid and case_valid:
                district = district_form.save()
                case = case_form.save(commit=False)
                case.district = district
                case.save()
            elif not add_new_district and district_valid and case_valid:
                case = case_form.save(commit=False)
                case.district = District.objects.get(id=obj_primary_key)
                case.save()
            #
            #

            # ENSURES IF THE BINDER FORM IS VALID.
            # IF NEW, ADD IT TO DB AND CASE, ELSE, ADD THE EXISTING ONE TO CASE
            try:
                existing_binder = Binder.objects.get(master_dr=request.POST['binder-master_dr'])
                binder_valid = True
            except Binder.DoesNotExist:
                existing_binder = None # then create a new binder

            if binder_valid and existing_binder != None:
                case.binders.add(existing_binder)
            elif binder_valid:
                binder = binder_form.save()
                case.binders.add(binder)
            #
            #
            
            if victim_valid:
                victim = victim_form.save()
                case.victims.add(victim)
            if suspect_valid:
                suspect = suspect_form.save()
                case.suspects.add(suspect)

            if event_valid:
                event = event_form.save(commit=False)
                event.case = case
                event.save()

            existing_case.delete()
            return HttpResponseRedirect('/detail/' + case.dr_nbr)
        else:
            print('hey')
            render(request, '400-bad-request.html', {})







        # # post_copy = request.POST.copy()
        # # for field in post_copy:
        # #     if post_copy[field] == 'None':
        # #         post_copy[field] = ''
        #
        # district_form = DistrictForm(request.POST, prefix='district')
        # binder_form = BinderForm(request.POST, prefix='binder')
        # case_form = CaseForm(request.POST, prefix='case')
        # event_form = EventForm(request.POST, prefix='event')
        # victim_form = PersonForm(request.POST, prefix='victim')
        # suspect_form = PersonForm(request.POST, prefix='suspect')
        #
        # if request.POST['case-dr_nbr'] != case_id:
        #     try:
        #         case = Case.objects.get(dr_nbr=request.POST['case-dr_nbr'])
        #         print("Dr Number already exists")
        #         render(request, '400-bad-request.html', {
        #         'case_form' : request.POST[case_form],
        #         })
        #     except:
        #         print('Valid Dr')
        #         print(case_form.errors)
        #         event = get_object_or_404(Event, case=case_id)
        #         case = Case.objects.get(dr_nbr = case_id)
        #         original_case = Case.objects.get(dr_nbr = case_id)
        #         original_district = case.district
        #
        #         case.dr_nbr = request.POST['case-dr_nbr']
        #         for field in case_form.fields:
        #             print(str(field) + " : " + str(case_form[field].value()))
        #             setattr(case, field, case_form[field].value() or None)
        #
        #         #for victim in original_case.victims.all():
        #         #    case.victims.add(victim)
        #
        #         #for suspect in original_case.suspects.all():
        #         #    case.suspects.add(suspect)
        #
        #         #for binder in original_case.binders.all():
        #         #    case.binders.add(binder)
        #
        #         #case.district = original_district
        #         case.save(force_update = True, dr_nbr = request.POST['case-dr_nbr'])
        #         #original_case.delete()
        #         event.case = case;
        #         event.save()
        #         # for field in case._meta.fields:
        #         #     setattr(case, field.name, case_form[field.name])
        #         # case.save()
        # else:
        #     pass


        #   CASE 1: Check if DR_NBR is already in DB -> Throw error
        #   CASE 2: If DR_NBR IS THE SAME -> UPDATE EVERY OTHER FIELD
        #   CASE 3: NEW DR_NBR -> Create and validat the new form. Delete Existing shit
        #
        #
        #
        #
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

        # district_valid = district_form.is_valid()
        # binder_valid = binder_form.is_valid()
        # case_valid = case_form.is_valid()
        # event_valid = event_form.is_valid()
        # victim_valid = victim_form.is_valid()
        # suspect_valid = suspect_form.is_valid()
        #
        # print(district_form.errors)
        # print(binder_form.errors)
        # print(case_form.errors)
        # print(event_form.errors)
        # print(victim_form.errors)
        # print(suspect_form.errors)

        # if district_valid and case_valid:
        #     case = get_object_or_404(Case, dr_nbr = case_id)
        #     district = get_object_or_404(District, id = case.district.id)
        #     for field in case:
        #         print(field)
        #         case[field] = case_form[field]

def advanced_search(request):
    return render(request, 'advanced-search.html', {})

def district_detail(request, district_id):
    office = get_object_or_404(District, id=district_id)
    return render(request, 'district/detail.html', {'district': district})
