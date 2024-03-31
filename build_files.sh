#!/bin/bash

# Install packages from requirements.txt
echo "Installing Python packages from requirements.txt..."
python3 -m pip install --user -r requirements.txt

# Ensure pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip could not be found, attempting to install..."
    python3 -m ensurepip --user
fi

# Ensure Django is installed
if ! python3 -c "import django" &> /dev/null
then
    echo "Django could not be found, installing..."
    python3 -m pip install --user django
fi

# Ensure psycopg2 is installed and compatible with Django
DJANGO_VERSION=$(python3 -c "import django; print(django.get_version())")
PSYCOPG2_VERSION=$(python3 -m pip show psycopg2-binary | grep -E '^Version:' | awk '{print $2}')

if [ -z "$PSYCOPG2_VERSION" ]; then
    echo "psycopg2 is not installed, installing compatible version..."
    python3 -m pip install --user "psycopg2-binary>=2.8"
else
    echo "psycopg2 version $PSYCOPG2_VERSION is installed."
fi

# Create staticfiles_build directory
mkdir -p staticfiles_build/static

# Set STATIC_ROOT in Django settings
export DJANGO_SETTINGS_MODULE=mess_automation_system.settings
python3 -c "
import os
from django.conf import settings
settings.configure(
    STATIC_ROOT=os.path.join(os.path.dirname(os.path.abspath(__file__)), 'staticfiles_build', 'static')
)
print('STATIC_ROOT:', settings.STATIC_ROOT)
"

# Collect static files
echo "Collecting static files..."
python3 manage.py collectstatic --noinput --clear

# Do any additional build steps here
