from django.shortcuts import render


def main(request):
    context = {"title": "tviewer"}
    return render(request, "modules/main.html", context)
