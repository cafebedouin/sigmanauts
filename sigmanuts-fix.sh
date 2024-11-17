#!/bin/bash

# sigmanuts-fix.sh
# Fix deprecated Hugo references and suppress warnings.

echo "Starting Hugo site fixes in /home/mike/sigmanauts..."

# Backup config.toml
cp config.toml config.toml.bak
echo "Backed up config.toml to config.toml.bak."

# Add ignoreLogs setting to suppress raw HTML warnings
if ! grep -q "ignoreLogs" config.toml; then
    echo -e "\n# Suppress raw HTML warnings\nignoreLogs = ['warning-goldmark-raw-html']" >> config.toml
    echo "Added ignoreLogs setting to config.toml."
else
    echo "ignoreLogs setting already exists in config.toml."
fi

# Replace deprecated .Site.Author
find . -type f -name "*.html" -exec sed -i 's/\.Site\.Author/.Site.Params.Author/g' {} +
echo "Replaced .Site.Author with .Site.Params.Author."

# Replace deprecated .Site.IsServer
find . -type f -name "*.html" -exec sed -i 's/\.Site\.IsServer/hugo.IsServer/g' {} +
echo "Replaced .Site.IsServer with hugo.IsServer."

# Replace deprecated .Site.IsMultiLingual
find . -type f -name "*.html" -exec sed -i 's/\.Site\.IsMultiLingual/hugo.IsMultilingual/g' {} +
echo "Replaced .Site.IsMultiLingual with hugo.IsMultilingual."

# Replace deprecated .Site.LastChange
find . -type f -name "*.html" -exec sed -i 's/\.Site\.LastChange/.Site.Lastmod/g' {} +
echo "Replaced .Site.LastChange with .Site.Lastmod."

# Replace deprecated .Site.DisqusShortname
find . -type f -name "*.html" -exec sed -i 's/\.Site\.DisqusShortname/.Site.Config.Services.Disqus.Shortname/g' {} +
echo "Replaced .Site.DisqusShortname with .Site.Config.Services.Disqus.Shortname."

# Summarize actions
echo "All fixes applied. Please review changes before restarting Hugo."
echo "To revert config changes, use config.toml.bak."

# Exit
exit 0
