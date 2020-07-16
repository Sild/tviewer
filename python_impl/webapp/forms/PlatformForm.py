from django import forms
from ..models import Platform


class PlatformForm(forms.ModelForm):

    name = forms.CharField(
        label="Name",
        required=True,
    )

    site = forms.CharField(
        label="Site"
    )

    id = forms.CharField(
        widget=forms.HiddenInput()
    )

    class Meta:
        model = Platform
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super(PlatformForm, self).__init__(*args, **kwargs)
