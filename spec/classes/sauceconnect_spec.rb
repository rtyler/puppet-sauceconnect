require 'spec_helper'

describe 'sauceconnect' do
  let(:facts) do
    {:osfamily => 'debian'}
  end

  it 'should create a directory for the sc binary' do
    should contain_file('/usr/share/sauce').with({
      'ensure' => 'directory'
    })
  end

  it 'should place the sc binary' do
    should contain_file('/usr/share/sauce/sc').with({
      'ensure'  => 'present',
      'require' => 'File[/usr/share/sauce]'
    })
  end

  it 'should include the daemon class' do
    should include_class('sauceconnect::daemon')
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
