# -*- coding:utf-8 -*-

require 'serverspec'
require 'pathname'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe package("lv") do
   it { should be_installed }
end
