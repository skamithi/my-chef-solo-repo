require 'chefspec'

describe 'cisco-nexus::set_time' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'cisco-nexus::set_time' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
