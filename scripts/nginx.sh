#!/bin/bash

set -e

PROJECT_MAIN_DIR_NAME="CS"
FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS="cs_portal"

# Reload systemd daemon
sudo systemctl daemon-reload

# Copy Nginx config to conf.d
sudo cp "/home/ec2-user/$PROJECT_MAIN_DIR_NAME/nginx/nginx.conf" "/etc/nginx/conf.d/$FOLDER_NAME_WHERE_SETTINGS_FILE_EXISTS.conf"

# Create proxy_params file if missing (Amazon Linux doesn't have it by default)
if [ ! -f /etc/nginx/proxy_params ]; then
    echo "Creating missing /etc/nginx/proxy_params..."
    sudo tee /etc/nginx/proxy_params > /dev/null <<EOF
proxy_set_header Host \$host;
proxy_set_header X-Real-IP \$remote_addr;
proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto \$scheme;
EOF
fi

# Optional: Add ec2-user to nginx group
sudo usermod -a -G nginx ec2-user

# Test nginx config before restarting
echo "Testing nginx config..."
sudo nginx -t

# Restart nginx
echo "Restarting nginx..."
sudo systemctl restart nginx

echo "✅ Nginx setup complete."
