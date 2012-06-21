require 'spec_helper'

describe 'sauceconnect' do
  it 'should install the sauce gem' do
    should contain_package('sauce').with({
      'provider' => 'gem',
      'ensure'   => 'present'
    })
  end
end
