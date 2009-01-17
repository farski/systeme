require File.dirname(__FILE__) + '/test_helper'

class ImperialTest < Test::Unit::TestCase
  should "convert carat to kilogram" do
    assert_equal 0.0002, 1.carat
  end
end