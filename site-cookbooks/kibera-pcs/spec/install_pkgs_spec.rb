require 'chefspec'

describe 'kibera-pcs::install_pkgs' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'kibera-pcs::install_pkgs' }
  it 'should do something' do
    pending 'Your recipe examples go here.'
  end
end
