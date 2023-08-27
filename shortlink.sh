#!/bin/bash

# Function to shorten a link using is.gd
shorten_link() {
    local url="$1"
    local short=$(curl -s "https://is.gd/create.php?format=simple&url=$url")
    echo "$short"
}

# Function to display usage messages
show_usage() {
    echo "Usage: $0 URL"
    echo "Example: $0 https://webk.telegram.org/"
}

# Check if an argument was provided
if [ $# -ne 1 ]; then
    echo "You need to provide a URL to shorten."
    show_usage
    exit 1
fi

# URL provided as argument
original_url="$1"

# Shorten the link using the function
shortened_url=$(shorten_link "$original_url")

# Remove the "https://" prefix
shortened_url="${shortened_url#https://}"

echo "Original link: $original_url"
echo "Shortened link: $shortened_url"
