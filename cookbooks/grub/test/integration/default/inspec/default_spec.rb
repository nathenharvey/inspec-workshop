  describe file('/etc/grub.conf') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_symlink }
    it { should be_linked_to '../boot/grub/grub.conf' }
  end

  describe file('/boot/grub/grub.conf') do
    it { should be_file }
    its('mode') { should eq 0600 }
  end
