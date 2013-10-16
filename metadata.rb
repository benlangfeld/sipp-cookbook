name              "sipp"
maintainer        "Mojo Lingo LLC"
maintainer_email  "ops@mojolingo.com"
license           "MIT"
description       "Patches and Installs the SIPp load testing tool"
version           '1.0.0'

recipe            "sipp", "Fetches, patches, and installs SIPp"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute 'sipp',
  :display_name => 'SIPp',
  :description  => 'Hash of SIPp attributes',
  :type         => 'String'

attribute 'sipp/version',
  :display_name => 'SIPp Version',
  :description  => 'The version of SIPp to install',
  :type         => 'String'

attribute 'sipp/build_dependencies',
  :display_name => 'SIPp Build Dependencies',
  :description  => 'The OS packages to install as dependencies for building SIPp',
  :type         => 'Array'
