#
# Copyright (c) Quad Learning, Inc.
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

require 'spec_helper'

describe 'curl::dev' do
  let(:chef_run) { ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

  specify { expect(chef_run).to include_recipe('curl::default') }

  it 'installs the OpenSSL variant of libcurl development headers from packages' do
    expect(chef_run).to install_package('libcurl4-openssl-dev')
  end

  context 'with GnuTLS variant' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
        node.set['libcurl']['variant'] = 'gnutls'
      end.converge(described_recipe)
    end

    it 'installs the GnuTLS variant of libcurl development headers from packages' do
      expect(chef_run).to install_package('libcurl4-gnutls-dev')
    end
  end

  context 'with NSS variant' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04') do |node|
        node.set['libcurl']['variant'] = 'nss'
      end.converge(described_recipe)
    end

    it 'installs the NSS variant of libcurl development headers from packages' do
      expect(chef_run).to install_package('libcurl4-nss-dev')
    end
  end
end
