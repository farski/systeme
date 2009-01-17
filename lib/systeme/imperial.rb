require 'systeme/registration'

module Systeme
  module Imperial
    def self.included(caller)
      caller.send :include, Systeme::Imperial::Declarations
    end

    module Units
      Imperial = Hash.new

      Imperial['length'] = Hash.new
      Imperial['length'][:si] = 0.3048
      Imperial['length'][:units] = Array.new
      Imperial['length'][:units] << { :unit => 'thou', :factor => (1.0/12000), :aliases => ['mil'] }
      Imperial['length'][:units] << { :unit => 'inch', :factor => (1.0/12), :aliases => ['in', 'inches'] }
      Imperial['length'][:units] << { :unit => 'foot', :factor => 1, :aliases => ['feet', 'ft'] }
      Imperial['length'][:units] << { :unit => 'yard', :factor => 3, :aliases => ['yd'] }
      Imperial['length'][:units] << { :unit => 'furlong', :factor => 660 }
      Imperial['length'][:units] << { :unit => 'mile', :factor => 5280, :aliases => ['mi'] }
      Imperial['length'][:units] << { :unit => 'league', :factor => 15840 }
      # maritime units
      Imperial['length'][:units] << { :unit => 'fathom', :factor => 6 }
      Imperial['length'][:units] << { :unit => 'cable', :factor => 608 }
      Imperial['length'][:units] << { :unit => 'nautical_mile', :factor => 6080, :aliases => ['NM', 'nmi', 'M'] }
      Imperial['length'][:units] << { :unit => 'link', :factor => (66.0/100), :aliases => ['lnk'] }
      Imperial['length'][:units] << { :unit => 'rod', :factor => (66.0/4), :aliases => ['perch', 'perches', 'pole', 'lug'] }
      Imperial['length'][:units] << { :unit => 'chain', :factor => 66 }
      
      Imperial['weight'] = Hash.new
      Imperial['weight'][:si] = 0.45359237
      Imperial['weight'][:units] = Array.new
      Imperial['weight'][:units] << { :unit => 'grain', :factor => (1.0/7000) }
      Imperial['weight'][:units] << { :unit => 'drachm', :factor => (1.0/256) }
      Imperial['weight'][:units] << { :unit => 'ounce', :factor => (1.0/16), :aliases => ['oz'] }
      Imperial['weight'][:units] << { :unit => 'pound', :factor => 1, :aliases => ['lb', 'lbm', 'lbs'] }
      Imperial['weight'][:units] << { :unit => 'stone', :factor => 14, :aliases => ['st'] }
      Imperial['weight'][:units] << { :unit => 'quarter', :factor => 28 }
      Imperial['weight'][:units] << { :unit => 'hundredweight', :factor => 112, :aliases => ['cwt'] }
      Imperial['weight'][:units] << { :unit => 'ton', :factor => 2240 }
    end # Units
    
    module Declarations
      Systeme::Localize::declare_system(Systeme::Imperial::Units::Imperial)
    end
  end
end