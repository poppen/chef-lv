#
# Cookbook Name:: lv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

cache_path = Chef::Config[:file_cache_path]

arch = node['kernel']['machine'] =~ /x86_64/ ? 'x86_64' : 'i386'
src_rpm = "lv-#{node['lv']['version']}-#{node['lv']['rpm_version']}.src.rpm"
binary_rpm = "lv-#{node['lv']['version']}-#{node['lv']['rpm_version']}.#{arch}.rpm"

if node['platform'] == "centos" && node['platform_version'].to_i == 6
  %w{ rpm-build autoconf libtermcap-devel }.each do |pkg|
    package pkg do
      action :install
    end
  end

  remote_file "#{cache_path}/#{src_rpm}" do
    source "#{node['lv']['srcrpm_url']}/#{src_rpm}"
    checksum node['lv']['srcrpm_checksum']
  end

  bash "build lv" do
    not_if 'which lv'
    cwd cache_path
    code <<-EOC
    rpmbuild --define "_topdir #{cache_path}/lv" --rebuild #{src_rpm}
    EOC
  end

  package 'lv' do
    not_if 'which lv'
    action :install
    source "#{cache_path}/lv/RPMS/#{arch}/#{binary_rpm}"
  end
elsif node['platform'] == "centos" && node['platform_version'].to_i < 6
  package "lv" do
    action :install
  end
end
