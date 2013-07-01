require 'chefspec'

describe 'cisco-nexus::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'cisco-nexus::default' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
