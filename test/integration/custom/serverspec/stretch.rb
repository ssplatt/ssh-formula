describe file('/etc/ssh/sshd_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /^AcceptEnv LANG LC_\*/ }
  its(:content) { should match /^allowgroups wheel staff vagrant root/ }
  its(:content) { should match /^allowusers root user1 chuckie vagrant/ }
  its(:content) { should match /^challengeresponseauthentication no/ }
  its(:content) { should match /^denygroups nossh shallnotpass/ }
  its(:content) { should match /^denyusers todd roger emily/ }
  its(:content) { should match /^gssapiauthentication no/ }
  its(:content) { should match /^hostkey \/etc\/ssh\/ssh_host_rsa_key/ }
  its(:content) { should match /^hostkey \/etc\/ssh\/ssh_host_dsa_key/ }
  its(:content) { should match /^hostkey \/etc\/ssh\/ssh_host_ecdsa_key/ }
  its(:content) { should match /^hostkey \/etc\/ssh\/ssh_host_ed25519_key/ }
  its(:content) { should match /^listenaddress 0\.0\.0\.0/ }
  its(:content) { should match /^logingracetime 30/ }
  its(:content) { should match /^loglevel DEBUG/ }
  its(:content) { should match /^passwordauthentication yes/ }
  its(:content) { should match /^permitrootlogin without-password/ }
  its(:content) { should match /^port 22/ }
  its(:content) { should match /^printlastlog no/ }
  its(:content) { should match /^PrintMotd no/ }
  its(:content) { should match /^protocol 2/ }
  its(:content) { should match /^Subsystem sftp \/usr\/lib\/openssh\/sftp-server/ }
  its(:content) { should match /^tcpkeepalive yes/ }
  its(:content) { should match /^usedns no/ }
  its(:content) { should match /^usepam yes/ }
  its(:content) { should match /^x11forwarding yes/ }
  its(:content) { should match /^Match Group ssh_keyonly/ }
  its(:content) { should match /^  PasswordAuthentication no/ }
  its(:content) { should match /^  X11Forwarding no/ }
  its(:content) { should match /^Match User vagrant/ }
  its(:content) { should match /^  AllowTCPForwarding yes/ }
  its(:content) { should match /^  X11Forwarding yes/ }
end

describe file('/etc/ssh/ssh_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /^Host \*/ }
  its(:content) { should match /^  SendEnv LANG LC_\*/ }
  its(:content) { should match /^  HashKnownHosts yes/ }
  its(:content) { should match /^  GSSAPIAuthentication yes/ }
end
