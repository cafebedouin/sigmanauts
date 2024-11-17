#!/bin/bash

# replace-contact.sh
# Replace all occurrences of contact.html with contact.html in files under sigmanauts.

echo "Starting replacement of 'contact.html' with 'contact.html' in /home/mike/sigmanauts..."

# Find and replace contact.html with contact.html in all files
find . -type f -exec sed -i 's/contact\.md/contact\.html/g' {} +

echo "Replacement complete. Please review changes."
