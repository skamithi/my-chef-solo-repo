module Cisco
end

module Cisco::Errors
  class TimezoneNotDefined < ArgumentError; end
  class TimezoneInvalid < ArgumentError; end
end
