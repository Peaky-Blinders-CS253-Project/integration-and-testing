# Ensure pip is installed
if ! command -v pip &> /dev/null
then
    echo "pip could not be found"
    echo "Installing pip..."
    sudo apt update
    sudo apt install python3-pip
fi

# Install Python packages
echo "Installing Python packages..."
pip install -r requirements.txt

# Ensure Django is installed
if ! python3 -c "import django" &> /dev/null
then
    echo "Django could not be found"
    echo "Installing Django..."
    pip install django
fi

# Collect static files
echo "Collecting static files..."
python3 manage.py collectstatic
