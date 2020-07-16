from django.http import HttpResponseRedirect
from django.urls import reverse

from django.views.generic.list import ListView
from ..models import Platform
from ..forms import PlatformForm
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class PlatformListView(ListView):

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(PlatformListView, self).dispatch(request, *args, **kwargs)

    model = Platform
    template_name = "modules/platform.html"

    def get_context_data(self, **kwargs):
        context = super(PlatformListView, self).get_context_data(**kwargs)
        context["js_list"] = ["js/platform.js"]
        context["css_list"] = ["css/platform.css"]
        context["object_list"] = Platform.objects.all()
        context["form"] = PlatformForm
        return context


@login_required
def platform_update_or_create(request):
    print(request)
    id = request.POST["id"]
    if id is "":
        platform = Platform()
    else:
        platform = Platform.objects.get(pk=id)

    platform.edited_by = request.user
    platform.name = request.POST['name']
    platform.site = request.POST['site']
    platform.save()

    return HttpResponseRedirect(reverse('webapp:platform_list'))


@login_required
def platform_delete(_request, platform_id):
    Platform.objects.get(pk=platform_id).delete()
    return HttpResponseRedirect(reverse('webapp:platform_list'))
