# ssh-formula
configure ssh daemon and client

## Available states

install: install packages
config: configuration steps
service: enabled/disabled, start/stop the sshd service

## Minimal Config

```
ssh:
  enabled: true
  server_enabled: true
  client_enabled: true
  sftp_enabled: true
  server_pkg: openssh-server
  client_pkg: openssh-client
  sftp_pkg: openssh-sftp-server
  service:
    name: sshd
    state: running
    enable: true
```

## A more indepth example
```
ssh:
  enabled: true
  server_enabled: true
  client_enabled: true
  sftp_enabled: true
  server_pkg: openssh-server
  client_pkg: openssh-client
  sftp_pkg: openssh-sftp-server
  daemon:
    port: 22
    listenaddress: 0.0.0.0
    protocol: 2
    permitrootlogin: without-password
    passwordauthentication: 'yes'
    challengeresponseauthentication: 'no'
    x11forwarding: 'yes'
    tcpkeepalive: 'yes'
    usepam: 'yes'
    usedns: 'no'
    gssapiauthentication: 'no'
    allowusers: root user1 chuckie
    denyusers: todd roger emily
    allowgroups: wheel staff vagrant
    denygroups: nossh shallnotpass
  service:
    name: sshd
    state: running
    enable: true
```

## Debian 9
For Debian 9, the defaults and pillar structure has been updates slightly. The `ssh_config` and `sshd_config` files have been revamped to directly map the given yaml into the appropriate structure for the config files. Mostly, this does not change the way the pillar is structured with regards to a Debian 8 host but it adds the ability to include any arbitrary option.

```
ssh:
  enabled: true
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
  client:
    '*':
      SendEnv: 'LANG LC_*'
      HashKnownHosts: 'yes'
      GSSAPIAuthentication: 'yes'
```

## How to use test-kitchen on MacOSX

Install and setup brew:
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install vagrant with brew:
```
brew install cask
brew cask install vagrant
```

Install test-kitchen:
```
sudo gem install test-kitchen
sudo gem install kitchen-vagrant
sudo gem install kitchen-salt
```

Run a converge on the default configuration:
```
kitchen converge default
```
