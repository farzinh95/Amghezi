#!/bin/bash

# Backup existing Nginx configuration
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Create a new Nginx configuration with security settings
cat << 'EOF' > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 1024;
}

http {
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # Security headers
    add_header X-Content-Type-Options nosniff;
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header Content-Security-Policy "default-src 'self';";

    # Hide nginx version
    server_tokens off;

    # Limit request size
    client_max_body_size 1M;

    # Enable rate limiting
    limit_req_zone $binary_remote_addr zone=one:10m rate=10r/s;

    # Basic security settings
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH";

    # Logging settings
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    gzip on;
    gzip_disable "msie6";

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
EOF

# Reload Nginx to apply changes
systemctl reload nginx

echo "Nginx hardening completed."
