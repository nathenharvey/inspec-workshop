# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'File System Configuration'

c = command('/usr/bin/gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6')

# you add controls here
control '1.2.1 Verify CentOS GPG Key is Installed' do                        # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title 'Verify CentOS GPG Key is Installed'             # A human-readable title
  desc <<-EOF
    CentOS cryptographically signs updates with a GPG key to verify that they are valid.

    It is important to ensure that updates are obtained from a valid source to protect against spoofing that could lead to the inadvertent installation of malware on the system.
  EOF

  describe c do
    its('stdout') { should match /C1DA C52D 1664 E8A4 386D  BA43 0946 FCA2 C105 B9DE/ }
  end

  describe command('echo hello') do
    its('stdout') { should match /hello/ }
  end
end


# node26-denver-popup2.training.chef-demo.com
