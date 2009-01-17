require 'systeme/registration'

module Systeme

  module Metric

    def self.included(caller)
      caller.send :include, Systeme::Metric::Declarations
    end    

    module Units
      SI_BASE_UNITS = Hash.new
      SI_BASE_UNITS[:meter] = { :symbol => :m, :measure => "length" }
      SI_BASE_UNITS[:gram] = { :symbol => :g, :measure => "mass", :factor_offset => -3 }
      SI_BASE_UNITS[:second] = { :symbol => :s, :measure => "time" }
      SI_BASE_UNITS[:ampere] = { :symbol => :A, :measure => "electric current" }
      SI_BASE_UNITS[:kelvin] = { :symbol => :K, :measure => "thermodynamic temperature" }

      SI_UNIT_PREFIXES = Hash.new
      SI_UNIT_PREFIXES[:yocto] = { :factor => -24, :symbol_prefix => "y" }
      SI_UNIT_PREFIXES[:zepto] = { :factor => -21, :symbol_prefix => "z" }
      SI_UNIT_PREFIXES[:atto] = { :factor => -18, :symbol_prefix => "a" }
      SI_UNIT_PREFIXES[:femto] = { :factor => -15, :symbol_prefix => "f" }
      SI_UNIT_PREFIXES[:pico] = { :factor => -12, :symbol_prefix => "p" }
      SI_UNIT_PREFIXES[:nano] = { :factor => -9, :symbol_prefix => "n" }
      SI_UNIT_PREFIXES[:micro] = { :factor => -6, :symbol_prefix => "u" } # use of 'µ' should be supported with unicode?
      SI_UNIT_PREFIXES[:milli] = { :factor => -3, :symbol_prefix => "m" }
      SI_UNIT_PREFIXES[:centi] = { :factor => -2, :symbol_prefix => "c" }
      SI_UNIT_PREFIXES[:deci] = { :factor => -1, :symbol_prefix => "d" }
      SI_UNIT_PREFIXES[:deca] = { :factor => 1, :symbol_prefix => "da" }
      SI_UNIT_PREFIXES[:hecto] = { :factor => 2, :symbol_prefix => "h" }
      SI_UNIT_PREFIXES[:kilo] = { :factor => 3, :symbol_prefix => "k" }
      SI_UNIT_PREFIXES[:mega] = { :factor => 6, :symbol_prefix => "M" }
      SI_UNIT_PREFIXES[:giga] = { :factor => 9, :symbol_prefix => "G" }
      SI_UNIT_PREFIXES[:tera] = { :factor => 12, :symbol_prefix => "T" }
      SI_UNIT_PREFIXES[:peta] = { :factor => 15, :symbol_prefix => "P" }
      SI_UNIT_PREFIXES[:exa] = { :factor => 18, :symbol_prefix => "E" }
      SI_UNIT_PREFIXES[:zetta] = { :factor => 21, :symbol_prefix => "Z" }
      SI_UNIT_PREFIXES[:yotta] = { :factor => 24, :symbol_prefix => "Y" }
    end # Units
    
    module Declarations
      Systeme::Metric::Units::SI_BASE_UNITS.each do |unit, unit_data|
        unit_factor_offset = (unit_data[:factor_offset] ? unit_data[:factor_offset] : 0 )
        plural_unit_name = unit.to_s + "s"
        
        define_method(plural_unit_name.to_sym) { self * (10**(unit_factor_offset)) }
        class_eval("alias :" + unit_data[:symbol].to_s + " :" + plural_unit_name)
        class_eval("alias :" + plural_unit_name.chop + " :" + plural_unit_name)

        Systeme::Registration::names << plural_unit_name << unit_data[:symbol].to_s << plural_unit_name.chop
    
        Systeme::Metric::Units::SI_UNIT_PREFIXES.each do |prefix, prefix_data|
          plural_prefixed_unit_name = prefix.to_s + plural_unit_name 
          prefixed_symbol = prefix_data[:symbol_prefix] + unit_data[:symbol].to_s
      
          define_method(plural_prefixed_unit_name.to_sym) { self * (10**(prefix_data[:factor] + unit_factor_offset)) }
          class_eval("alias :" + prefixed_symbol + " :" + plural_prefixed_unit_name)
          class_eval("alias :" + plural_prefixed_unit_name.chop + " :" + plural_prefixed_unit_name)
          
          Systeme::Registration::names << plural_prefixed_unit_name << prefixed_symbol << plural_prefixed_unit_name.chop
        end
      end      
    end # Declarations

  end # Metric

end