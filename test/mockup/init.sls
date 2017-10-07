# -*- coding: utf-8 -*-
# vim: ft=sls
{%- from "ssh/map.jinja" import ssh with context %}

# http://serverspec.org/host_inventory.html
host_inventory_install_facter:
  pkg.installed:
    - name: facter
