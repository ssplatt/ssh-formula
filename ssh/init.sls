# -*- coding: utf-8 -*-
# vim: ft=sls
# Init ssh
{%- from "ssh/map.jinja" import ssh with context %}

{# Below is an example of having a toggle for the state #}
{% if ssh.enabled %}
include:
  - ssh.install
  - ssh.config
  - ssh.service
{% else %}
'ssh-formula disabled':
  test.succeed_without_changes
{% endif %}
