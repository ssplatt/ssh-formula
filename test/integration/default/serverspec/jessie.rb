describe file('/etc/ssh/sshd_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:md5sum) { should eq "91c30b1c96efe43b3e69ce4905fbdbd5" }
end

describe file('/etc/ssh/ssh_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:md5sum) { should eq "3e759197b6042fc76d3136eaeace612d" }
end
