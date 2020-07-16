from django.conf.urls import url
from django.views.generic.base import RedirectView
from django.contrib.auth.views import login
from django.contrib.auth.views import logout

from . import view

from django.conf.urls import url

from . import views

app_name = 'webapp'
urlpatterns = [

    url(r'^$', RedirectView.as_view(url='/profile', permanent=True), name='index'),
    url(r'^profile$', views.profile_show, name="profile_show"),
    url(r'^login$', login, name="login"),
    url(r'^logout$', logout, {'next_page': '/login'}, name="logout"),

    url(r'^platform/list$', views.PlatformListView.as_view(), name="platform_list"),
    url(r'^platform/(?P<platform_id>[0-9]+)/delete$', views.platform_delete, name="platform_delete"),
    url(r'^platform/update_or_create$', views.platform_update_or_create, name="platform_update_or_create"),

    url(r'^customer', view.main, name="customer_list"),
    url(r'^customer/(?P<pk>[0-9]+)', view.main, name="customer_detail"),

    url(r'^provider', view.main, name="provider_list"),
    url(r'^company', view.main, name="company_list"),
    url(r'^tender', view.main, name="tender_list"),

]
