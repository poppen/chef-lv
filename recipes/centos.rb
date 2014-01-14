#
# Cookbook Name:: lv
# Recipe:: centos
#
# Author:: MATSUI Shinsuke <poppen.jp@gmail.com>
#
# Copyright 2014, MATSUI Shinsuke
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cache_path = Chef::Config[:file_cache_path]

arch = node['kernel']['machine'] =~ /x86_64/ ? 'x86_64' : 'i386'
src_rpm = "lv-#{node['lv']['version']}-#{node['lv']['rpm_version']}.src.rpm"
binary_rpm = "lv-#{node['lv']['version']}-#{node['lv']['rpm_version']}.#{arch}.rpm"

if node['platform_version'].to_i == 6
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
else
  package "lv" do
    action :install
  end
end
