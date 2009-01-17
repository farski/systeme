require 'systeme/registration'
require 'systeme/localize'

module Systeme
  module Length
    def self.included(caller)
      caller.send :include, Systeme::Length::Declarations
    end
    
    module Units
      Length = Hash.new
      Length['astronomical_unit'] = { :si => 149597870691, :units => [ { :unit => 'astronomical_unit', :factor => 1, :aliases => ['AU', 'au'] } ] }
      Length['barleycorn'] = { :si => 0.00846666667, :units => [ { :unit => 'barleycorn', :factor => 1 } ] }
      Length['cubit'] = { :si => 0.5, :units => [ { :unit => 'cubit', :factor => 1 } ] }
      Length['finger'] = { :si => 0.022225, :units => [ { :unit => 'finger', :factor => 1 } ] }
      Length['hand'] = { :si => 0.1016, :units => [ { :unit => 'hand', :factor => 1 } ] }
    end
    
    module Declarations
      Systeme::Localize::declare_system(Systeme::Length::Units::Length)
    end
  end
end