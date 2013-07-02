class Chef
  class Recipe
    include Cisco
  end
end
# Log into the switch
#
# TODO figure out where to pull these variables from
term_session = Cisco::Nexus.new(:user => node[:nexususer], :host => node[:nexushost], :passwd => node[:nexuspasswd])
term_session.set_clock(node[:timezone])
log 'clock set on cisco nexus device'

