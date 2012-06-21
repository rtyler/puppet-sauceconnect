require 'spec_helper'

describe 'sauceconnect::debian' do
  it 'should install the JRE' do
    should contain_package('openjdk-6-jre').with({
      'ensure' => 'present'
    })
  end
end
