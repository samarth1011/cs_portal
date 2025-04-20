#!/bin/bash

# Replace with your actual project directory name
PROJECT_MAIN_DIR_NAME="CS"

# Replace with the folder name where your nginx config is located (typically your Django app folder)
FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS="core"

# Reload systemd daemon (if needed for other services like gunicorn)
sudo systemctl daemon-reload

# Optional: Remove default Nginx conf if modifying default server block
# Amazon Linux uses /etc/nginx/nginx.conf directly or /etc/nginx/conf.d/
# Not /sites-enabled or /sites-available by default

# Copy your Nginx config to conf.d (which is used in Amazon Linux)
sudo cp "/home/ec2-user/$PROJECT_MAIN_DIR_NAME/nginx/nginx.conf" "/etc/nginx/conf.d/$FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS.conf"

# Make sure nginx user exists (Amazon Linux usually uses 'nginx' user, not 'www-data')
# Optional: Add ec2-user to nginx group if needed
sudo usermod -a -G nginx ec2-user

# Restart Nginx to apply changes
sudo systemctl restart nginx
