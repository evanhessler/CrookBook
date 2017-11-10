from django.forms import ModelForm

from .models import District, Binder

class DistrictForm(ModelForm):
    class Meta:
        model = District
        fields = '__all__'

class BinderForm(ModelForm):
    class Meta:
        model = Binder
        fields = '__all__'
