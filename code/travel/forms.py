from django import forms

class TravelItemForm(forms.Form):
    content = forms.CharField(widget=forms.Textarea, required=True)
    longtitude = forms.FloatField(required=True, max_value=180, min_value=-180)
    latitude = forms.FloatField(required=True, max_value=90, min_value=-90)
    picture = forms.ImageField(required=True)
    date = forms.DateField(required=True)
    time = forms.TimeField(required=True)
