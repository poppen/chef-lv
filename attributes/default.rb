#
# Cookbook Name:: lv
# Attribute:: default
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

default['lv']['version'] = '4.51'

default['lv']['rpm_version'] = '8.1'
default['lv']['srcrpm_url'] = 'http://vault.centos.org/5.10/os/SRPMS'
default['lv']['srcrpm_checksum'] = '740ce98310c6324057fe82ee7392db6536fffc4e'
