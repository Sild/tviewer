from django.http import HttpResponseRedirect
from django.urls import reverse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required


@login_required
def profile_show(request):
    context = {"title": "profile"}
    return render(request, "modules/profile.html", context)