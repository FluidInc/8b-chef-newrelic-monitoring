maintainer       "Ry4an Brase"
maintainer_email "rbrase-opscode@ry4an.org"
license          "Apache 2.0"
description      "Installs/Configures New Relic Monitoring "
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe "newrelic_monitoring", "Installs and configured newrelic monitoring"

%w{ ubuntu debian redhat fedora centos }.each do |os|
  supports os
end
