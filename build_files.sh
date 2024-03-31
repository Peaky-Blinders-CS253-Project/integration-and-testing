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

# Collect static files
echo "Collecting static files..."
python3 manage.py collectstatic
