require File.dirname(__FILE__) + '/test_helper'

class ImperialTest < Test::Unit::TestCase
  should "maintain base unit value through declaration" do
    assert_equal 1, 1.ft
    assert_equal 1, 1.lb
  end
  
  should "express non-base unit value in the base unit" do
    assert_equal 3, 1.yd
    assert_equal 14, 1.stone
  end
  
  # should "convert value from base unit to any other unit" do
  #   assert_equal 1000, 1.kg.to_g
  #   assert_equal 100, 1.m.to_cm
  # end
  # 
  # should "convert value between arbitrary units" do
  #   assert_equal 1, 1000.mg.to_g
  #   assert_equal 10, 1.cm.to_mm
  # end
end