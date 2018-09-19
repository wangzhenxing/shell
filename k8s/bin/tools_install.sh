#!/bin/bash

yum install -y libnetfilter_conntrack-devel libnetfilter_conntrack conntrack-tools ipvsadm

modprobe -- ip_vs
modprobe -- ip_vs_rr
modprobe -- ip_vs_wrr
modprobe -- ip_vs_sh
modprobe -- nf_conntrack_ipv4
mod 755 /etc/rc.local

echo "
# sysctl settings are defined through files in
# /usr/lib/sysctl.d/, /run/sysctl.d/, and /etc/sysctl.d/.
#
# Vendors settings live in /usr/lib/sysctl.d/.
# To override a whole file, create a new file with the same in
# /etc/sysctl.d/ and put new settings there. To override
# only specific settings, add a file with a lexically later
# name in /etc/sysctl.d/ and put new settings there.
#
# For more information, see sysctl.conf(5) and sysctl.d(5).

kernel.sysrq                        = 0
kernel.core_uses_pid                = 1
kernel.msgmnb                       = 65536
kernel.msgmax                       = 65536
kernel.shmmax                       = 68719476736
kernel.shmall                       = 4294967296

fs.file-max                         = 1000000

vm.max_map_count                    = 500000

net.bridge.bridge-nf-call-iptables  = 1
net.core.netdev_max_backlog         = 32768
net.core.somaxconn                  = 32768
net.core.wmem_default               = 8388608
net.core.rmem_default               = 8388608
net.core.wmem_max                   = 16777216
net.core.rmem_max                   = 16777216

net.ipv4.ip_forward                 = 1
net.ipv4.tcp_max_syn_backlog        = 65536
net.ipv4.tcp_syncookies             = 1
net.ipv4.tcp_timestamps             = 0
net.ipv4.tcp_synack_retries         = 2
net.ipv4.tcp_syn_retries            = 2
net.ipv4.tcp_tw_recycle             = 1
net.ipv4.tcp_tw_reuse               = 1
net.ipv4.tcp_max_tw_buckets         = 300000
net.ipv4.tcp_mem                    = 94500000 915000000 927000000
net.ipv4.tcp_max_orphans            = 3276800
net.ipv4.tcp_keepalive_time         = 1200
net.ipv4.tcp_keepalive_intvl        = 30
net.ipv4.tcp_keepalive_probes       = 3
net.ipv4.tcp_fin_timeout            = 30
net.ipv4.icmp_echo_ignore_all       = 0
net.ipv4.ip_local_port_range        = 1024 65535
net.ipv4.conf.all.rp_filter               = 0
net.ipv4.conf.default.rp_filter           = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.lo.arp_announce             = 2
net.ipv4.conf.all.arp_announce            = 2

net.ipv6.conf.all.disable_ipv6      = 1
net.ipv6.conf.all.accept_redirects  = 1

" >  /etc/sysctl.conf
sysctl -p

