Description
===========

Installs new relic monitoring agent.

Requirements
============

Tested on Ubuntu. Should work on Debian, Red Hat, CentOS, and Fedora

Cookbooks
---------

No other cookbooks are required.

Attributes
==========

* `node['newrelic']['license_key']` - Your new relic license key. From Account Settings -> Account Information.

Usage
=====

Include `recipe[newrelic_monitoring]` in a run list to have the system monitored. This performs a baseline installation. You'll need to change the `node['newrelic']['license_key']` attribute to the key from your New Relic Settings page.

References
==========

* [New Relic home page](http://newrelic.com/)
* [Monitoring Announcement](http://blog.newrelic.com/2011/11/08/server-monitoring-is-here/)
* [Gist](https://gist.github.com/1348720) by Eron Nicholson with earlier work

License and Author
==================

Author: Ry4an Brase (<ry4an-opscode@ry4an.org>)
Copyright 2011, 8thBridge, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
