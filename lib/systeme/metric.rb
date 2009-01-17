require 'systeme/registration'

module Systeme
  module Metric
    def self.included(caller)
      caller.send :include, Systeme::Metric::Declarations
    end    

    module Units
      SI = Hash.new
      SI[:meter] = { :symbol => :m, :measure => "length" }
      SI[:gram] = { :symbol => :g, :measure => "mass", :factor_offset => -3 }
      SI[:second] = { :symbol => :s, :measure => "time" }
      SI[:ampere] = { :symbol => :A, :measure => "electric current" }
      SI[:kelvin] = { :symbol => :K, :measure => "thermodynamic temperature" }

      Prefixes = Hash.new
      Prefixes[:yocto] = { :factor => -24, :symbol_prefix => "y" }
      Prefixes[:zepto] = { :factor => -21, :symbol_prefix => "z" }
      Prefixes[:atto] = { :factor => -18, :symbol_prefix => "a" }
      Prefixes[:femto] = { :factor => -15, :symbol_prefix => "f" }
      Prefixes[:pico] = { :factor => -12, :symbol_prefix => "p" }
      Prefixes[:nano] = { :factor => -9, :symbol_prefix => "n" }
      Prefixes[:micro] = { :factor => -6, :symbol_prefix => "u" } # use of 'µ' should be supported with unicode?
      Prefixes[:milli] = { :factor => -3, :symbol_prefix => "m" }
      Prefixes[:centi] = { :factor => -2, :symbol_prefix => "c" }
      Prefixes[:deci] = { :factor => -1, :symbol_prefix => "d" }
      Prefixes[:deca] = { :factor => 1, :symbol_prefix => "da" }
      Prefixes[:hecto] = { :factor => 2, :symbol_prefix => "h" }
      Prefixes[:kilo] = { :factor => 3, :symbol_prefix => "k" }
      Prefixes[:mega] = { :factor => 6, :symbol_prefix => "M" }
      Prefixes[:giga] = { :factor => 9, :symbol_prefix => "G" }
      Prefixes[:tera] = { :factor => 12, :symbol_prefix => "T" }
      Prefixes[:peta] = { :factor => 15, :symbol_prefix => "P" }
      Prefixes[:exa] = { :factor => 18, :symbol_prefix => "E" }
      Prefixes[:zetta] = { :factor => 21, :symbol_prefix => "Z" }
      Prefixes[:yotta] = { :factor => 24, :symbol_prefix => "Y" }
    end # Units
    
    module Declarations
      Systeme::Metric::Units::SI.each do |unit, unit_data|
        unit_factor_offset = (unit_data[:factor_offset] ? unit_data[:factor_offset] : 0 )
        plural_unit_name = unit.to_s + "s"
        
        define_method(plural_unit_name.to_sym) { self * (10**(unit_factor_offset)) }
        class_eval("alias :" + unit_data[:symbol].to_s + " :" + plural_unit_name)
        class_eval("alias :" + plural_unit_name.chop + " :" + plural_unit_name)
        Systeme::Registration::names << plural_unit_name << unit_data[:symbol].to_s << plural_unit_name.chop
    
        Systeme::Metric::Units::Prefixes.each do |prefix, prefix_data|
          plural_prefixed_unit_name = prefix.to_s + plural_unit_name 
          prefixed_symbol = prefix_data[:symbol_prefix] + unit_data[:symbol].to_s
      
          define_method(plural_prefixed_unit_name.to_sym) { self * (10**(prefix_data[:factor] + unit_factor_offset)) }
          class_eval("alias :" + prefixed_symbol + " :" + plural_prefixed_unit_name)
          class_eval("alias :" + plural_prefixed_unit_name.chop + " :" + plural_prefixed_unit_name)          
          Systeme::Registration::names << plural_prefixed_unit_name << prefixed_symbol << plural_prefixed_unit_name.chop
        end
      end      
    end # Declarations
  end
end