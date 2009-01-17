require 'systeme/international'
require 'systeme/localize'
require 'systeme/metric'
require 'systeme/imperial'
require 'systeme/length'
require 'systeme/conversions'
require 'systeme/registration'

module Systeme
  include Systeme::International
  include Systeme::Localize
  include Systeme::Metric
  include Systeme::Imperial
  include Systeme::Length
  include Systeme::Conversions
end

Numeric.send :include, Systeme