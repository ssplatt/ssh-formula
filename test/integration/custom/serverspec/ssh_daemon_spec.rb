require 'spec_helper'

if host_inventory['facter']['os']['release']['major'] == "9"
  require 'stretch'
else
  require 'jessie'
end
