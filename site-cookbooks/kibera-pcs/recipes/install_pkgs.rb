# GNS3 is the best IOS emulator out there
package 'gns3'

#install core medibuntu files
execute "install medibuntu" do
  command "sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update"
end

%w{libdvdcss2 mplayer-gui non-free-codecs w32codecs}.each do |w|
  package w
end

