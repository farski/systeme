module Systeme
  module Registration
    class << self
      attr_accessor :names
    end
    @names = Array.new
  end
end