require 'spec_helper'

describe 'sauceconnect::daemon' do
  let(:params) do
    {
      :username => 'sauce',
      :apikey   => 'sauceapikey'
    }
  end

  it 'should create the log directory' do
    should contain_file('/var/log/sauce').with_ensure('directory')
  end

  it 'should install the defaults file' do
    should contain_file('/etc/default/sauce-connect').with({
      'ensure' => 'present'
    })
  end

  it 'should install the init.d script' do
    should contain_file('/etc/init.d/sauce-connect').with({
      'ensure' => 'present',
      'mode'   => '0755',
      'notify' => 'Service[sauce-connect]'
    })
  end

  it 'should create a Service resource' do
    should contain_service('sauce-connect').with({
      'ensure'     => 'running',
      'hasrestart' => 'true'
    })
  end
end
