# encoding: utf-8
# copyright: 2015, The Authors
# license: All rights reserved

title 'OS Services'


control '2.1.1 Remove telnet-server' do
  impact 1.0
  title 'Remove telnet-server'
  desc <<-EOF
    The telnet-server package contains the telnetd daemon, which accepts connections from users from other systems via the telnet protocol.

    The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow a user with access to sniff network traffic the ability to steal credentials. The ssh package provides an encrypted session and stronger security and is included in most Linux distributions.
  EOF
  describe package('telnet-server') do
    it { should_not be_installed }
  end
end
