# -*- coding: utf-8 -*-
# vim: ft=sls
# How to install ssh
{%- from "ssh/map.jinja" import ssh with context %}

{% if ssh.server_enabled %}
ssh_server_pkg:
  pkg.installed:
    - name: {{ ssh.server_pkg }}
    {% if ssh.fromrepo is defined -%}
    - fromrepo: {{ ssh.fromrepo }}
    {% endif -%}
    {% if ssh.version is defined -%}
    - version: {{ ssh.version }}
    {% endif -%}
{% endif %}

{% if ssh.client_enabled %}
ssh_client_pkg:
  pkg.installed:
    - name: {{ ssh.client_pkg }}
    {% if ssh.fromrepo is defined -%}
    - fromrepo: {{ ssh.fromrepo }}
    {% endif -%}
    {% if ssh.version is defined -%}
    - version: {{ ssh.version }}
    {% endif -%}
{% endif %}

{% if ssh.sftp_enabled %}
ssh_sft_pkg:
  pkg.installed:
    - name: {{ ssh.sftp_pkg }}
    {% if ssh.fromrepo is defined -%}
    - fromrepo: {{ ssh.fromrepo }}
    {% endif -%}
    {% if ssh.version is defined -%}
    - version: {{ ssh.version }}
    {% endif -%}
{% endif %}
