#!/bin/bash

# Update the package list
apt update

# Install Certbot and the web server specific plugin (uncomment as per your server)
# For Nginx:
apt install -y certbot python3-certbot-nginx

# For Apache:
# apt install -y certbot python3-certbot-apache

# Obtain SSL certificates from Let's Encrypt
# Note: Replace 'your_domain' with your actual domain name
#       Replace 'your_email@example.com' with your email address for certificate registration

# For Nginx:
certbot --nginx -d your_domain -d www.your_domain --non-interactive --agree-tos -m your_email@example.com

# For Apache:
# certbot --apache -d your_domain -d www.your_domain --non-interactive --agree-tos -m your_email@example.com

# Test automatic renewal
certbot renew --dry-run

# Create a cron job for automatic renewal
# This will open the crontab editor, add the following line:
# 0 0,12 * * * /usr/bin/certbot renew --quiet
# The cron job runs the renewal script twice a day. Certbot will check if the certificates are due for renewal and renew them if necessary.

(crontab -l ; echo "0 0,12 * * * /usr/bin/certbot renew --quiet") | crontab -

# Note: If your server does not have a crontab, this will create a new one. 
# You can modify the timing according to your preference.

# Print completion message
echo "Let's Encrypt SSL setup complete and automatic renewal configured."
