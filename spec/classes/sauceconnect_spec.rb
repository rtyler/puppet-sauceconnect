require 'spec_helper'

describe 'sauceconnect' do
  let(:facts) do
    {:osfamily => 'debian'}
  end

  it 'should install the sauce gem' do
    should contain_package('sauce').with({
      'provider' => 'gem',
      'ensure'   => 'present'
    })
  end

  context 'on Debian family systems' do
    let(:facts) do
      { :osfamily => 'debian' }
    end

    it 'should pull in the right dependency class' do
      should include_class('sauceconnect::debian')
    end
  end

  context 'on Red Hat family systems' do
    let(:facts) do
      { :osfamily => 'redhat' }
    end

    it 'should pull in the right dependency class' do
      should include_class('sauceconnect::redhat')
    end
  end
end
