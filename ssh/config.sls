# -*- coding: utf-8 -*-
# vim: ft=sls
# How to configure ssh
{% from "ssh/map.jinja" import ssh with context %}

{% if ssh.server_enabled %}
ssh_daemon_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://ssh/files/{{ grains.oscodename }}/sshd_config.j2
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - config: {{ ssh.daemon }}
{% endif %}

{% if ssh.client_enabled %}
ssh_client_config:
  file.managed:
    - name: /etc/ssh/ssh_config
    - source: salt://ssh/files/{{ grains.oscodename }}/ssh_config.j2
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - config: {{ ssh.client }}
{% endif %}
