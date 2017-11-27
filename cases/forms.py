from django.forms import ModelForm

from .models import District, Binder, Person, Case, Event

class DistrictForm(ModelForm):
    class Meta:
        model = District
        fields = '__all__'

class BinderForm(ModelForm):
    class Meta:
        model = Binder
        fields = '__all__'

class PersonForm(ModelForm):
    class Meta:
        model = Person
        fields = '__all__'

class CaseForm(ModelForm):
    class Meta:
        model = Case
        exclude = ['related_cases', 'district', 'victims', 'suspects']

class EventForm(ModelForm):
    class Meta:
        model = Event
        exclude = ['case']
