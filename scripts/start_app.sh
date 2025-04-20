#!/bin/bash
set -e

PROJECT_MAIN_DIR_NAME="CS"

# Validate variable
if [ -z "$PROJECT_MAIN_DIR_NAME" ]; then
    echo "Error: PROJECT_MAIN_DIR_NAME is not set." >&2
    exit 1
fi

PROJECT_DIR="/home/ec2-user/$PROJECT_MAIN_DIR_NAME"

# Change ownership to ec2-user (Amazon Linux typically uses ec2-user, not ubuntu)
sudo chown -R ec2-user:ec2-user "$PROJECT_DIR"

# Change to project directory
cd "$PROJECT_DIR"

# Activate virtual environment
echo "Activating virtual environment..."
source "$PROJECT_DIR/venv/bin/activate"

# Run Django collectstatic
echo "Running collectstatic..."
python manage.py collectstatic --noinput

# Restart Gunicorn and Nginx
echo "Restarting Gunicorn and Nginx services..."
sudo systemctl restart gunicorn
sudo systemctl restart nginx

echo "✅ Application started successfully."
