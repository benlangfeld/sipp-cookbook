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
