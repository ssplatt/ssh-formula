describe file('/etc/ssh/sshd_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:md5sum) { should eq "4ddf04c84b7b44fcf0f589f0bf684836" }
end

describe file('/etc/ssh/ssh_config') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:md5sum) { should eq "ba37757e893e07e8ff988a296904f7cf" }
end
