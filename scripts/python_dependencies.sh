#!/bin/bash
set -e

PROJECT_MAIN_DIR_NAME="CS"

# Validate variables
if [ -z "$PROJECT_MAIN_DIR_NAME" ]; then
    echo "Error: PROJECT_MAIN_DIR_NAME is not set. Please set it to your project directory name." >&2
    exit 1
fi

PROJECT_DIR="/home/ec2-user/$PROJECT_MAIN_DIR_NAME"

# Change ownership to ec2-user (not ubuntu — Amazon Linux usually uses ec2-user)
sudo chown -R ec2-user:ec2-user "$PROJECT_DIR"

# Ensure virtualenv is installed
if ! command -v virtualenv &> /dev/null; then
    echo "Installing virtualenv..."
    sudo pip3 install virtualenv
fi

# Create virtual environment
echo "Creating virtual environment..."
virtualenv "$PROJECT_DIR/venv"

# Activate virtual environment
echo "Activating virtual environment..."
source "$PROJECT_DIR/venv/bin/activate"

# Install dependencies
echo "Installing Python dependencies..."
pip install -r "$PROJECT_DIR/requirements.txt"

echo "✅ Dependencies installed successfully."
