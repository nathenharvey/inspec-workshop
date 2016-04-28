#
# Cookbook Name:: grub
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
file '/boot/grub/grub.conf' do
  mode '0600'
end
