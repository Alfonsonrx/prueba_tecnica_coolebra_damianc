from django.urls import path
from .views import *
app_name = 'testfunctions'
urlpatterns = [
  path('get_data/', get_processed_data_view), 
]