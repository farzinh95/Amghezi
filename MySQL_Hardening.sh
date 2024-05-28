#!/bin/bash

# Ensure MySQL is installed
if ! command -v mysql &> /dev/null
then
    echo "MySQL is not installed. Installing MySQL..."
    apt update
    apt install -y mysql-server
fi

# Backup MySQL configuration file
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bak

# Update MySQL configuration file with security settings
cat << 'EOF' >> /etc/mysql/my.cnf

# Security settings
[mysqld]
# Disable remote root access
skip-networking

# Bind to localhost only
bind-address = 127.0.0.1

# Disable symbolic-links
symbolic-links = 0

# Secure file permissions
secure-file-priv = /var/lib/mysql-files

# Disable the use of LOAD DATA LOCAL INFILE
local-infile = 0

# Set the default authentication plugin to sha256_password
default-authentication-plugin = sha256_password

# Limit the allowed ciphers for SSL/TLS connections
ssl-cipher = DHE-RSA-AES256-SHA:AES128-SHA

# Enable SSL
require_secure_transport = ON

# General settings
sql_mode = STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

# Logging settings
log_error = /var/log/mysql/error.log
EOF

# Restart MySQL service to apply changes
systemctl restart mysql

# Run MySQL secure installation script
echo "Running MySQL secure installation script..."
mysql_secure_installation <<EOF

y
strong_root_password
strong_root_password
y
y
y
y
EOF

# Create a script to monitor and harden MySQL periodically
cat << 'EOF' > /usr/local/bin/mysql_hardening.sh
#!/bin/bash

# Update MySQL user privileges
mysql -u root -pstrong_root_password -e "
DELETE FROM mysql.user WHERE User='';
DROP USER IF EXISTS ''@'localhost';
DROP USER IF EXISTS ''@'$(hostname)';
DROP USER IF EXISTS 'root'@'%';
FLUSH PRIVILEGES;"

# Remove test database and access to it
mysql -u root -pstrong_root_password -e "
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;"

# Check and repair tables
mysqlcheck -u root -pstrong_root_password --auto-repair --all-databases

echo "MySQL hardening completed."
EOF

# Make the hardening script executable
chmod +x /usr/local/bin/mysql_hardening.sh

# Schedule the hardening script to run daily
(crontab -l ; echo "0 2 * * * /usr/local/bin/mysql_hardening.sh") | crontab -

echo "MySQL hardening script created and scheduled."

