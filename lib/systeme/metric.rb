require 'systeme/registration'

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
      Systeme::Metric::Units::Metric.each do |measure, data|
        data[:units].each do |unit|
          define_method(unit[:unit].to_sym) { self * unit[:factor].to_f * data[:si] }
          class_eval("alias :" + unit[:unit] + "s :" + unit[:unit])
          Systeme::Registration::names << unit[:unit] << unit[:unit]+"s"
          if unit[:aliases]
            unit[:aliases].each do |aka|
               class_eval("alias :" + aka + " :" + unit[:unit])
               Systeme::Registration::names << aka
             end
          end
        end
      end
    end
  end
end