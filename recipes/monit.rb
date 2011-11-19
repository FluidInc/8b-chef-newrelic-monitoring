#
# Cookbook Name:: newrelic
# Recipe:: monit
#
# Copyright 2011, CustomInk, LLC
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

service "monit"

service_path = `which service`.strip

# set-up monit
template "/etc/monit.d/newrelic_sysmond" do
  source "monit_newrelic_sysmond.erb"
  variables(
    :pid_file => "/var/run/nrsysmond.pid",
    :start_program => "#{service_path} newrelic-sysmond start",
    :stop_program => "#{service_path} newrelic-sysmond stop",
    :max_memory => node[:newrelic][:monit][:max_memory],
    :max_cpu => node[:newrelic][:monit][:max_cpu]
  )
  
  owner "root"
  group "root"
  mode 0755
  notifies :restart, resources(:service => "monit")
end
