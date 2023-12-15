
# Restricts kernel pointers to enhance security.
echo "kernel.kptr_restrict = 2" >> /etc/sysctl.d/farzin.conf

# Enables TCP RFC 1337 to mitigate time-wait assassination attacks.
echo "net.ipv4.tcp_rfc1337 = 1" >> /etc/sysctl.d/farzin.conf

# Disables kexec_load system call to prevent loading a new kernel.
echo "kernel.kexec_load_disabled = 1" >> /etc/sysctl.d/farzin.conf

# Sets kernel printk values for message logging.
echo "kernel.printk = 4 4 4 4" >> /etc/sysctl.d/farzin.conf

# Enhances address space layout randomization for improved security.
echo "kernel.randomize_va_space = 2" >> /etc/sysctl.d/farzin.conf

# Sets sysrq key handling to restrict certain kernel operations.
echo "kernel.sysrq = 4" >> /etc/sysctl.d/farzin.conf

# Logs martian packets for improved network security.
echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/farzin.conf

# Sets low threshold for IP fragment memory to prevent fragmentation-based attacks.
echo "net.ipv4.ipfrag_low_thresh = 500000" >> /etc/sysctl.d/farzin.conf

# Disables TCP DSACK (Duplicate Selective Acknowledgments).
echo "net.ipv4.tcp_dsack = 0" >> /etc/sysctl.d/farzin.conf

# Disables TCP FACK (Forward Acknowledgment).
echo "net.ipv4.tcp_fack = 0" >> /etc/sysctl.d/farzin.conf

# Sets the number of TCP keepalive probes to detect dead TCP connections.
echo "net.ipv4.tcp_keepalive_probes = 4" >> /etc/sysctl.d/farzin.conf

# Sets the time interval between TCP keepalive probes.
echo "net.ipv4.tcp_keepalive_time = 1200" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of pending TCP SYN requests.
echo "net.ipv4.tcp_max_syn_backlog = 8192" >> /etc/sysctl.d/farzin.conf

# Disables TCP SACK (Selective Acknowledgments).
echo "net.ipv4.tcp_sack = 0" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of asynchronous I/O requests.
echo "fs.aio-max-nr = 524288" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of file handles.
echo "fs.file-max = 65535" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of queued inotify events.
echo "fs.inotify.max_queued_events = 1048576" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of inotify instances for a user.
echo "fs.inotify.max_user_instances = 1048576" >> /etc/sysctl.d/farzin.conf

# Sets the maximum number of inotify watches for a user.
echo "fs.inotify.max_user_watches = 1048576" >> /etc/sysctl.d/farzin.conf

# Allows core dumps to contain process IDs.
echo "kernel.core_uses_pid = 1" >> /etc/sysctl.d/farzin.conf

# Restricts access to kernel logs.
echo "kernel.dmesg_restrict = 1" >> /etc/sysctl.d/farzin.conf

# Sets maximum bytes and keys for kernel keyrings.
echo "kernel.keys.maxbytes = 2000000" >> /etc/sysctl.d/farzin.conf
echo "kernel.keys.maxkeys = 2000" >> /etc/sysctl.d/farzin.conf

# Sets the maximum process ID.
echo "kernel.pid_max = 65536" >> /etc/sysctl.d/farzin.conf

# Specifies the default value for kernel printk.
echo "kernel.printk = 4 4 4 4" >> /etc/sysctl.d/farzin.conf

# Enhances address space layout randomization for improved security.
echo "kernel.randomize_va_space = 2" >> /etc/sysctl.d/farzin.conf

# Sets sysrq key handling to disable certain kernel operations.
echo "kernel.sysrq = 0" >> /etc/sysctl.d/farzin.conf

# Disables sysrq key handling for security.
echo "kernel.sysrq = 4" >> /etc/sysctl.d/farzin.conf

# Disables ICMP redirect acceptance for all network interfaces.
echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Disables source route acceptance for all network interfaces.
echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/farzin.conf

# Logs martian packets for all network interfaces.
echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/farzin.conf

# Enables reverse path filtering for all network interfaces.
echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.d/farzin.conf

# Disables secure ICMP redirects for all network interfaces.
echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Disables ICMP redirects for all network interfaces.
echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Disables ICMP redirect acceptance for the default network interface.
echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Disables source route acceptance for the default network interface.
echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/farzin.conf

# Enables reverse path filtering for the default network interface.
echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.d/farzin.conf

# Disables secure ICMP redirects for the default network interface.
echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Disables ICMP redirects for the default network interface.
echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/farzin.conf

# Ignores broadcast ICMP Echo requests.
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.d/farzin.conf

# Disables IP forwarding.
echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.d/farzin.conf

# Sets the local port range for allocating ephemeral ports.
echo "net.ipv4.ip_local_port_range = 2000" >> /etc/sysctl.d/farzin.conf

# Sets the high threshold for IP fragment memory to prevent fragmentation-based attacks.
echo "net.ipv4.ipfrag_high_thresh = 1000000" >> /etc/sysctl.d/farzin.conf

# Sets the low threshold for IP fragment memory to prevent fragmentation-based attacks.
echo "net.ipv4.neigh.default.gc_thresh3 = 8192" >> /etc/sysctl.d/farzin.conf


#run it in the running config
sysctl -p /etc/sysctl.d/farzin.conf
