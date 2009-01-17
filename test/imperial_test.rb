require File.dirname(__FILE__) + '/test_helper'

class ImperialTest < Test::Unit::TestCase
  should "express imperial unit in metric base unit" do
    assert_in_delta 0.9144, 1.yard, 0.0001
  end
  
  should "express non-base unit value in the base unit" do
    assert_equal 3.feet, 1.yard
    assert_equal 14.pounds, 1.stone
  end
  
  should "convert value from base unit to any other unit" do
    assert_equal 16, 1.pound.in_ounces
  end
end