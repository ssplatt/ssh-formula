describe file('/etc/ssh/sshd_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /^Port 22/ }
  its(:content) { should match /^ListenAddress 0\.0\.0\.0/ }
  its(:content) { should match /^Protocol 2/ }
  its(:content) { should match /^HostKey \/etc\/ssh\/ssh_host_rsa_key/ }
  its(:content) { should match /^HostKey \/etc\/ssh\/ssh_host_dsa_key/ }
  its(:content) { should match /^HostKey \/etc\/ssh\/ssh_host_ecdsa_key/ }
  its(:content) { should match /^HostKey \/etc\/ssh\/ssh_host_ed25519_key/ }
  its(:content) { should match /^UsePrivilegeSeparation yes/ }
  its(:content) { should match /^KeyRegenerationInterval 3600/ }
  its(:content) { should match /^ServerKeyBits 1024/ }
  its(:content) { should match /^SyslogFacility AUTH/ }
  its(:content) { should match /^LogLevel DEBUG/ }
  its(:content) { should match /^LoginGraceTime 30/ }
  its(:content) { should match /^PermitRootLogin without-password/ }
  its(:content) { should match /^StrictModes yes/ }
  its(:content) { should match /^RSAAuthentication yes/ }
  its(:content) { should match /^PubkeyAuthentication yes/ }
  its(:content) { should match /^IgnoreRhosts yes/ }
  its(:content) { should match /^RhostsRSAAuthentication no/ }
  its(:content) { should match /^HostbasedAuthentication no/ }
  its(:content) { should match /^IgnoreUserKnownHosts yes/ }
  its(:content) { should match /^PermitEmptyPasswords no/ }
  its(:content) { should match /^ChallengeResponseAuthentication no/ }
  its(:content) { should match /^PasswordAuthentication yes/ }
  its(:content) { should match /^X11Forwarding yes/ }
  its(:content) { should match /^X11DisplayOffset 10/ }
  its(:content) { should match /^PrintMotd no/ }
  its(:content) { should match /^PrintLastLog no/ }
  its(:content) { should match /^TCPKeepAlive yes/ }
  its(:content) { should match /^AcceptEnv LANG LC_\*/ }
  its(:content) { should match /^PermitUserEnvironment yes/ }
  its(:content) { should match /^Subsystem sftp \/usr\/lib\/openssh\/sftp-server/ }
  its(:content) { should match /^UsePAM yes/ }
  its(:content) { should match /^UseDNS no/ }
  its(:content) { should match /^GSSAPIAuthentication no/ }
  its(:content) { should match /^AllowTcpForwarding yes/ }
  its(:content) { should match /^DenyUsers todd roger emily/ }
  its(:content) { should match /^AllowUsers root user1 chuckie vagrant/ }
  its(:content) { should match /^DenyGroups nossh shallnotpass/ }
  its(:content) { should match /^AllowGroups wheel staff vagrant root/ }
  its(:content) { should match /^Match Group ssh_keyonly/ }
  its(:content) { should match /^  PasswordAuthentication no/ }
  its(:content) { should match /^  X11Forwarding no/ }
  its(:content) { should match /^Match User vagrant/ }
  its(:content) { should match /^  X11Forwarding yes/ }
  its(:content) { should match /^  AllowTCPForwarding yes/ }
end

describe file('/etc/ssh/ssh_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /^Host \*/ }
  its(:content) { should match /^\s+ForwardAgent no/ }
  its(:content) { should match /^\s+SendEnv LANG LC_\*/ }
  its(:content) { should match /^\s+HashKnownHosts yes/ }
  its(:content) { should match /^\s+GSSAPIAuthentication yes/ }
  its(:content) { should match /^\s+GSSAPIDelegateCredentials no/ }
end
