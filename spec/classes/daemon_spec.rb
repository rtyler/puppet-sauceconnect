require 'spec_helper'

describe 'sauceconnect::daemon' do
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
