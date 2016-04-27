# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'File System Configuration'

# you add controls here
control '1.2.1 Verify CentOS GPG Key is Installed' do
  impact 1.0
  title 'Verify CentOS GPG Key is Installed'
  desc <<-EOF
    CentOS cryptographically signs updates with a GPG key to verify that they are valid.

    It is important to ensure that updates are obtained from a valid source to protect against spoofing that could lead to the inadvertent installation of malware on the system.
  EOF

  describe command('/usr/bin/gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6') do
    its('stdout') { should match /C1DA C52D 1664 E8A4 386D  BA43 0946 FCA2 C105 B9DE/ }
  end
end

control '1.2.2 Verify that gpgcheck is Globally Activated' do
  impact 1.0
  title 'Verify that gpgcheck is Globally Activate'
  desc <<-EOF
    The gpgcheck option, found in the main section of the /etc/yum.conf file determines if an RPM package's signature is always checked prior to its installation.

    It is important to ensure that an RPM's package signature is always checked prior to installation to ensure that the software is obtained from a trusted source.
  EOF

  describe file('/etc/yum.conf') do
    its(:content) { should match /^gpgcheck=1/ }
  end

  options = {
    assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
    comment_char: '[' # parse_config_file seems to be choking on '[main]' so let's set '[' as a comment character
  }
  describe parse_config_file('/etc/yum.conf', options) do
    its('gpgcheck') { should cmp 1 }
  end
end
