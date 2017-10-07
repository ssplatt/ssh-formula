# -*- coding: utf-8 -*-
# vim: ft=sls
# Manage service for service ssh
{%- from "ssh/map.jinja" import ssh with context %}

ssh_service:
  service.{{ ssh.service.state }}:
    - name: {{ ssh.service.name }}
    - enable: {{ ssh.service.enable }}
    - watch:
        - file: ssh_daemon_config
        {% if ssh.client_enabled -%}
        - file: ssh_client_config
        {%- endif %}
