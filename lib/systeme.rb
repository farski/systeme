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

	def self.parse(string)
		return nil if (!string || !string.match(/\d/))
		
		string.gsub!(/ */,  '').gsub!(/([a-zA-Z])(\d)/, '\1 \2')
		parts = string.split(' ')
		total = parts.inject(0) do |total, part|
			value = part.to_f
			label = ((l = part.match(/([a-zA-Z]+)/)) ? l[1] : "m")			
			total += (value.respond_to?(label) ? value.send(label) : 0)
		end
		
		return total
	end
end

Numeric.send :include, Systeme

puts Systeme.parse('1m')