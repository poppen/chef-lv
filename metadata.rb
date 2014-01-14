name             'lv'
maintainer       'MATSUI Shinsuke'
maintainer_email 'poppen.jp@gmail.com'
license          'Apache 2.0'
description      'Installs lv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe 'lv', 'Installs lv'

%w{ centos ubuntu }.each do |os|
    supports os
end
