require 'systeme/registration'
require 'systeme/localize'

module Systeme
  module Metric
    def self.included(caller)
      caller.send :include, Systeme::Metric::Declarations
    end
    
    module Units
      Metric = Hash.new
      Metric['carat'] = { :si => 0.0002, :units => [ { :unit => 'carat', :factor => 1, :aliases => ['CD'] } ] }
    end
    
    module Declarations
      Systeme::Localize::declare_system(Systeme::Metric::Units::Metric)
    end
  end
end