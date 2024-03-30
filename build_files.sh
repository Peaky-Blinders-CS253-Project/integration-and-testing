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





# Collect static files
echo "Collecting static files..."
python3 manage.py collectstatic
