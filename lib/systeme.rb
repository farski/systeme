require 'systeme/metric'
require 'systeme/imperial'
require 'systeme/conversions'
require 'systeme/registration'

module Systeme
  include Systeme::Metric
  include Systeme::Imperial
  include Systeme::Conversions
end

Numeric.send :include, Systeme

# puts 1.kg.in_grams
# puts 1000.g