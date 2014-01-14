#
# Cookbook Name:: lv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


case node['platform']
when "centos"
  include_recipe "lv::centos"
else
  package "lv" do
    action :install
  end
end
