require 'expect4r'

module Cisco
  
  class AnyRouterSwitch

    attr_accessor :term_session, :errors

    def initialize(options = {} )
      @errors = {}
      @user = options[:user]
      @host = options[:host]
      @passwd = options[:passwd]
      if @user.nil? || @user.empty?
        @errors[:user] = 'Cannot be blank'
      end
      if @host.nil? || @host.empty?
        @errors[:host] = 'Cannot be blank'
      end
      if @passwd.nil? || @passwd.empty?
        @errors[:passwd] = 'Cannot be blank'
      end
      if @errors.empty? && @term_session.nil?
        login
      end
    end

  end

  class Nexus < AnyRouterSwitch
    # Nexus Switch Login
    # creates @terminal_session variable.
    # Call it external to class using term_session
    def login
      @term_session = Expect4r::Nexus.new_ssh :host => @host, 
        :user => @user, :pwd => @passwd
    end

    # Look at the code to determine which timezone variable to use
    # TODO create function that returns list of acceptable timezones
    def set_clock(timezone) 
      str = nil
      case timezone
      when 'Eastern'
        str = 'clock timezone EST -5 0 \n'
        str += 'clock summer-time EDT 2 Sun Mar 02:00 1 Sun Nov 02:00 60'
      end
      @term_session.config %{
        str
      }
    end
  end
end
