from django.test import TestCase
from django.urls import reverse
from django.test import Client
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from .models import Platform


def create_platform(name, site, edited_by):
    return Platform(name=name, site=site, edited_by=edited_by)


def check_response_is_ok(self, response):
    self.assertEqual(response.status_code, 200, msg="Response code should be 200")


def check_anauthorized_access_return_redirect(self, response):
    self.assertEqual(response.status_code, 302, msg="Authentication should be required")


def authorized(func):
    def wrapper(*args, **kw):
        args[0].user = User.objects.create(username='test', password='test')
        args[0].user.set_password('test')
        args[0].user.save()
        args[0].user = authenticate(username='test', password='test')
        login = args[0].client.login(username='test', password='test')
        args[0].assertTrue(login, msg="Authorization failed")
        return func(*args, **kw)
    return wrapper


class PlatformViewTest(TestCase):

    def test_unauthorized_access_get_redirect(self):
        response = self.client.get(reverse('webapp:platform_list'))
        check_anauthorized_access_return_redirect(self, response)

    @authorized
    def test_new_platform_appear_after_create(self):
        """
        check platform count after create is platform count before create + 1
        """

        #
        response = self.client.get(reverse('webapp:platform_list'))
        check_response_is_ok(self, response)
        platform_count = len(response.context['object_list'])

        platform = create_platform("testplatform", "https://siteurl.com", self.user)
        platform.save()

        response = self.client.get(reverse('webapp:platform_list'))
        check_response_is_ok(self, response)
        self.assertIn(platform, response.context['object_list'])

        expected_count = platform_count + 1
        self.assertEqual(expected_count, len(response.context['object_list']))
