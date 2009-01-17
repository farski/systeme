require 'systeme/registration'

module Systeme
  module Conversions
    def method_missing(method_id, *arguments)
      if match = method_id.to_s.match(/in_([a-zA-Z]+)/)
        if Systeme::Registration::names.include?(match[1])
          self / 1.0.send(match[1])
        else
          super
        end
      else
        super
      end
    end
  end # Conversions
end