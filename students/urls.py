# students/urls.py
from django.urls import path
from students.views import BaseMealPrecancellationView,StudentCardView, StudentLoginView, StudentLogoutView, \
 StudentdashboardView, StudentRegisterView
from .views import ExtraItemListView, ExtraItemDetailView, book_extra_item, student_breakdown_view, booking_success
from students import views

urlpatterns = [
    path('base-meal-precancellation/<str:roll_number>/', BaseMealPrecancellationView.as_view(), name='base_meal_precancellation'),
    path('student-card/<str:roll_number>/', StudentCardView.as_view(), name='student_card'),
    path('student-login/', StudentLoginView.as_view(), name='student_login'),
    path('student-register/', StudentRegisterView.as_view(), name='student_register'),
    path('student-logout/', StudentLogoutView.as_view(), name='student_logout'),
    path('student-dashboard/<int:rollno>/', StudentdashboardView.as_view(), name='student_dashboard'),
    path('extra-items/', ExtraItemListView.as_view(), name='extra_item_list'),
    path('extra-items/<int:pk>/', ExtraItemDetailView.as_view(), name='extra_item_detail'),
    path('book-extra/<int:pk>/', book_extra_item, name='book_extra_item'),
    path('booking-success/', booking_success, name='booking_success'),
    path('student-breakdown/', student_breakdown_view, name='student_breakdown'),
    # Add other URLs as needed
    
]
