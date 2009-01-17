require 'systeme/registration'

module Systeme
  module Conversions    
    def method_missing(method_name, *arguments)      
      if match_data = method_name.to_s.match(/in_([a-zA-Z]+)/)
        if Systeme::Registration::names.include?(match_data[1])
          return self / 1.0.send(match_data[1])
        end
      end
      
      return super    
    end   
  end
end