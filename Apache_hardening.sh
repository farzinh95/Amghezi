#!/bin/bash

# Backup existing Apache configuration
cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak

# Create a new Apache configuration with security settings
cat << 'EOF' > /etc/apache2/conf-available/security.conf
# Hide Apache version and OS from errors
ServerTokens Prod
ServerSignature Off

# Disable directory listing
<Directory /var/www/>
    Options -Indexes
</Directory>

# Prevent clickjacking
Header always append X-Frame-Options SAMEORIGIN

# Prevent MIME type sniffing
Header set X-Content-Type-Options nosniff

# Enable Cross-Site Scripting (XSS) filter
Header set X-XSS-Protection "1; mode=block"

# Set Content Security Policy (CSP)
Header set Content-Security-Policy "default-src 'self';"

# Restrict methods
<LimitExcept GET POST HEAD>
    Deny from all
</LimitExcept>

# Limit request size
LimitRequestBody 1048576

# Disable TRACE method
TraceEnable off

# Enable rate limiting (requires mod_ratelimit)
<IfModule mod_ratelimit.c>
    SetOutputFilter RATE_LIMIT
    SetEnv rate-limit 400
</IfModule>
EOF

# Enable security configuration
a2enconf security

# Enable required Apache modules
a2enmod headers
a2enmod rewrite
a2enmod ssl
a2enmod ratelimit

# Reload Apache to apply changes
systemctl reload apache2

echo "Apache hardening completed."
