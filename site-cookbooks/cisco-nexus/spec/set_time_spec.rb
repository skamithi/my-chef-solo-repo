require 'chefspec'
require 'expect4r'

describe 'cisco-nexus::set_time' do
  let(:chef_run) { ChefSpec::ChefRunner.new }
  before do
    obj = Object.new
    obj.stub(:config)
    obj.stub(:exp_send)
    obj.stub(:to_exec).and_return('finished')
    chef_run.node.set['timezone']  = 'eastern'
    chef_run.node.set['nexuspasswd'] = '12345'
    chef_run.node.set['nexususer'] = 'admin'
    chef_run.node.set['nexushost'] = '10.1.1.1'
    Expect4r::Nexus.stub(:new_ssh).and_return(obj)
    chef_run.converge 'cisco-nexus::set-time'
  end
  it 'should configure the nexus device with the clock config' do
    expect(chef_run).to log('clock set on cisco nexus device')
  end
end
