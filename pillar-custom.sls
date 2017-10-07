# -*- coding: utf-8 -*-
# vim: ft=yaml
# Custom Pillar Data for ssh

ssh:
  enabled: true
  server_enabled: true
  client_enabled: true
  sftp_enabled: true
  server_pkg: openssh-server
  client_pkg: openssh-client
  sftp_pkg: openssh-sftp-server
  #version: 1:6.3p1-1
  #fromrepo: unstable
  daemon:
    port: 22
    listenaddress: 0.0.0.0
    protocol: 2
    hostkey:
      - /etc/ssh/ssh_host_rsa_key
      - /etc/ssh/ssh_host_dsa_key
      - /etc/ssh/ssh_host_ecdsa_key
      - /etc/ssh/ssh_host_ed25519_key
    permitrootlogin: without-password
    passwordauthentication: 'yes'
    challengeresponseauthentication: 'no'
    x11forwarding: 'yes'
    tcpkeepalive: 'yes'
    usepam: 'yes'
    usedns: 'no'
    printlastlog: 'no'
    gssapiauthentication: 'no'
    allowusers: root user1 chuckie vagrant
    denyusers: todd roger emily
    allowgroups: wheel staff vagrant root
    denygroups: nossh shallnotpass
    loglevel: DEBUG
    logingracetime: 30
    PrintMotd: 'no'
    AcceptEnv: 'LANG LC_*'
    Subsystem: 'sftp /usr/lib/openssh/sftp-server'
    match:
      group:
        'ssh_keyonly':
          PasswordAuthentication: 'no'
          X11Forwarding: 'no'
      user:
        'vagrant':
          X11Forwarding: 'yes'
          AllowTCPForwarding: 'yes'
  {% if grains.oscodename == "stretch" -%}
  client:
    '*':
      SendEnv: 'LANG LC_*'
      HashKnownHosts: 'yes'
      GSSAPIAuthentication: 'yes'
  {% endif -%}
