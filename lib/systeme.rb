require 'systeme/international'
require 'systeme/metric'
require 'systeme/imperial'
require 'systeme/conversions'
require 'systeme/registration'

module Systeme
  include Systeme::International
  include Systeme::Localize
  include Systeme::Metric
  include Systeme::Imperial
  include Systeme::Conversions
end

Numeric.send :include, Systeme

puts 1.carat