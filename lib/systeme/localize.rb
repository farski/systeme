require 'systeme/registration'

module Systeme
  module Localize
    def self.declare_system(dictionary)
      dictionary.each do |measure, data|
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