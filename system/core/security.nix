# security tweaks borrowed from @hlissner
{
  boot.kernel.sysctl = {
    # The Magic SysRq key is a key combo that allows users connected to the
    # system console of a Linux kernel to perform some low-level commands.
    # Disable it, since we don't need it, and is a potential security concern.
    "kernel.sysrq" = 0;

    ## TCP hardening
    # Prevent bogus ICMP errors from filling up logs.
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    # Reverse path filtering causes the kernel to do source validation of
    # packets received from all interfaces. This can mitigate IP spoofing.
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    # Do not accept IP source route packets (we're not a router)
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
    # Don't send ICMP redirects (again, we're not a router)
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    # Refuse ICMP redirects (MITM mitigations)
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    # Protects against SYN flood attacks
    "net.ipv4.tcp_syncookies" = 1;
    # Incomplete protection again TIME-WAIT assassination
    "net.ipv4.tcp_rfc1337" = 1;

    ## TCP optimization
    # TCP Fast Open is a TCP extension that reduces network latency by packing
    # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
    # both incoming and outgoing connections:
    "net.ipv4.tcp_fastopen" = 3;
    # Bufferbloat mitigations + slight improvement in throughput & latency
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "cake";
  };

  boot.kernelModules = ["tcp_bbr"];

  security = {
    # allow wayland lockers to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;

    # don't ask for password for wheel group
    sudo.wheelNeedsPassword = false;
    pki.certificateFiles = [ 
	./kube.crt 
    ];
    pki.certificates = ["
-----BEGIN CERTIFICATE-----
MIIDBTCCAe2gAwIBAgIIGoZKf7GyR6YwDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE
AxMKa3ViZXJuZXRlczAeFw0yNDA5MTYyMDQ3NThaFw0zNDA5MTQyMDUyNThaMBUx
EzARBgNVBAMTCmt1YmVybmV0ZXMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQDPvR6+lHJ9bEyQNxbQ8WMx/nGBKPjmSmaQ5/m/crC7GsmtWY9tTQGui3zq
5yXnIZPGVgwikPAI01e+AG706DsJUbe2FX/tYwxe60Nz9VOAp5IdlfH3CZ9Ptd3U
l/2wABvAsY5AlgbmuIsJMAK8azWdEW1FHXqc+6oPcHSm9JY09yMzZP1xm9DPbojm
A819NpazuWhCskU1m0Q++/KBXOWaWDC+KWO893gWS6oa4/hooN+x0yeZmphjovxa
WbTrke8y3+KPv+gXjbqokak28KTYCtuPjK/3VkztI05dLznGtfCEELM8ce/+D9oa
3kuzgJDpbQnUGcNfsPLacTS4QpFXAgMBAAGjWTBXMA4GA1UdDwEB/wQEAwICpDAP
BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBRap9o8X2h8WduMcQo3uoj0KuV8YjAV
BgNVHREEDjAMggprdWJlcm5ldGVzMA0GCSqGSIb3DQEBCwUAA4IBAQB0VPMnBa9V
Q32EgpOTil5STOwfbDe0UTTJA1Cn5XWFsQgUDBofrapmMegk9JhK4QETlmYN5pvC
QE3ouv2EnwIaG+fQfuZT3uf+GT2UU4meH8lxZMvsDFESelWE0VJeiMre30DYqnvn
MDtLm0I+ccfYPYLIabc8t+ceY7QoKjm6HY3JKtmoAXwerPdG/nW2qfkmDQrKg+2H
JTjGgIlE695t/c45WQOJTsnZRmWxBE9U8KbMTYuEaNYkwwoIHRNbuz2U8E5Hp70B
CDlcEgckTA4TsGiF7Xj7B0UBNRL+rMBtqHrkq16F1VAg8bR20dnlZJhyd6aWO4Q8
5Pe4IqDlpY0O
-----END CERTIFICATE-----"
    ];
  };
}
