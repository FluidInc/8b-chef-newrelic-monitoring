#
# Cookbook Name:: newrelic_monitoring
# Recipe:: default
#
# Copyright 2011, 8thBridge, Inc.
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

case node['platform']
when 'ubuntu', 'debian'

  # step 1
  execute "apt-get-update" do
    command "apt-get update"
    action :nothing
  end

  remote_file "/etc/apt/sources.list.d/newrelic.list" do
    source "http://download.newrelic.com/debian/newrelic.list"
    owner "root"
    group "root"
    mode 0640
    notifies :run, "execute[apt-get-update]", :immediately
  end

  # step 2
  package "newrelic-sysmond" do
    action :upgrade
    options "--allow-unauthenticated"
  end

when "redhat", "centos", "fedora"

  # step 1
  repo_rpm = "http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm"

  remote_file "#{Chef::Config[:file_cache_path]}/#{repo_rpm}" do
    source "http://download.newrelic.com/pub/newrelic/el5/i386/#{repo_rpm}"
    mode 0644
  end

  package "newrelic-repo" do
    source "#{Chef::Config[:file_cache_path]}/#{repo_rpm}"
    action :install
    provider Chef::Provider::Package::Rpm
  end

  # step 2
  package "newrelic-sysmond" do
    action :upgrade
  end

end

# step 3
execute "nrsysmond-config" do
  command "nrsysmond-config --set license_key=#{node[:newrelic][:license_key]}"
  action :run
end

# step 4
service "newrelic-sysmond" do
  supports :restart => true, :status => true
  action [:enable, :start]  
end
