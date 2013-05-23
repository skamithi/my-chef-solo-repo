require 'chefspec'

describe 'kibera-pcs::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'kibera-pcs::default' }
  subject { chef_run }
  it { expect(chef_run).to include_recipe 'kibera-pcs::install_pkgs' }
end
