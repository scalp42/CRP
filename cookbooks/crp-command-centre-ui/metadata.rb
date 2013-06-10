name             "crp-command-centre-ui"
maintainer       "EPAM Systems"
maintainer_email "sergii_golovatiuk@epam.com"
license          "All rights reserved"
description      "Installs/Configures crp-command-centre-ui"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.1"

recipe 'crp-command-centre-ui', "Installs and Configures nginx configuration for fuse esb as backproxy"

depends 'nginx', '>= 1.6.0'
depends 'ssl', '>= 1.0.7'
