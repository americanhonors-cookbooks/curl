# curl Cookbook

[![Build Status](https://travis-ci.org/americanhonors/chef-curl.svg?branch=master)][build-status]
[![Dependency Status](https://gemnasium.com/americanhonors/chef-curl.svg)][dependency-status]

Installs and configures [curl and libcurl][curl].

## Requirements

### Cookbooks

The following cookbooks are direct dependencies:

* [apt][apt-cookbook]

### Platforms

The following platforms are supported and tested:

* Ubuntu 12.04

Other Debian distributions are assumed to work.

## Attributes

### default

* `node['curl']['package_name']` - Name of the package used to install curl.
* `node['libcurl']['variant']` - The variant of libcurl to install. One of `openssl`, `gnutls`, `nss` (Default: `openssl`)
* `node['libcurl']['package_name']` - Name of the package used to install libcurl (Default: depends on `node['libcurl']['variant']`)
* `node['libcurl']['dev_package_name']` - Name of the package used to install libcurl development headers (Default: depends on `node['libcurl']['variant']`)

## Recipes

### default

The default recipe will install curl and libcurl via packages, with the variant of libcurl specified by `node['libcurl']['variant']`.

### dev

The dev recipe will install libcurl development headers via packages, with the variant of libcurl specified by `node['libcurl']['variant']`.

## Usage

Include the default recipe in your node or role and specify the libcurl variant if you wish to use GnuTLS or NSS.

Use the dev recipe if you need development headers for libcurl.

## Development & Testing

### Rake

    $ bundle exec rake -T
    rake integration:cloud    # Run Test Kitchen with cloud plugins
    rake integration:vagrant  # Run Test Kitchen with Vagrant
    rake spec                 # Run ChefSpec examples
    rake style                # Run all style checks
    rake style:chef           # Lint Chef cookbooks
    rake style:ruby           # Run Ruby style checks
    rake travis               # Run all tests on Travis

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `feature/add-new-recipe`)
3. Write your change
4. Write ChefSpec and/or Serverspec tests for your change (if applicable)
5. Run the tests (see above), ensuring they all pass
6. Submit a Pull Request

## License & Authors

* Author:: Tony Burns (<tony.burns@americanhonors.org>)

```text
Copyright (c) 2014 Quad Learning, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

### Opscode Cookbooks

The test-kitchen harness in this cookbook and its documentation was inspired by
and adapted from the official [Opscode cookbooks][opscode-cookbooks].

* Author:: Joshua Timberman (<joshua@opscode.com>)
* Author:: Adam Jacob (<adam@opscode.com>)
* Author:: AJ Christensen (<aj@opscode.com>)
* Author:: Jamie Winsor (<jamie@vialstudios.com>)

```text
Copyright 2008-2013, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[build-status]: https://travis-ci.org/americanhonors/chef-curl
[dependency-status]: https://gemnasium.com/americanhonors/chef-curl
[curl]: http://curl.haxx.se/
[apt-cookbook]: https://github.com/opscode-cookbooks/apt
[opscode-cookbooks]: https://github.com/opscode-cookbooks
