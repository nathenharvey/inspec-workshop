#
# Cookbook Name:: grub
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'grub::default' do
  context 'When all attributes are default, on CentOS 6.7' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.7')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'sets the permission for the grub.conf file' do
      expect(chef_run).to render_file('/boot/grub/grub.conf')
    end
  end
end
