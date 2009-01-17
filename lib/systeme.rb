require 'systeme/metric'

module Systeme
  include Systeme::Metric
end

Numeric.send :include, Systeme