from django.forms import ModelForm

from .models import District, Binder, Case, Event, Person

class DistrictForm(ModelForm):
    class Meta:
        model = District
        fields = '__all__'

class BinderForm(ModelForm):
    class Meta:
        model = Binder
        fields = '__all__'

class CaseForm(ModelForm):
    class Meta:
        model = Case
        exclude = ['related_cases', 'district', 'binder']

class EventForm(ModelForm):
    class Meta:
        model = Event
        exclude = ['case']

class PersonForm(ModelForm):
    class Meta:
        model = Person
        exclude = ['case']
