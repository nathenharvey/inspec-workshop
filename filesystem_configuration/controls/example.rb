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
