require 'chefspec'

describe 'kibera-pcs::install_pkgs' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'kibera-pcs::install_pkgs' }
  subject { chef_run }
  ['gns3', 'libdvdcss2', 'mplayer-gui', 'non-free-codecs', 'w32codecs'].each do  |pkg|
    it { expect(chef_run).to install_package pkg }
  end
end
