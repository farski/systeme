require File.dirname(__FILE__) + '/test_helper'

class MetricTest < Test::Unit::TestCase
  should "maintain base unit value through declaration" do
    assert_equal 1, 1.kg
    assert_equal 1, 1.m
  end
  
  should "express non-base unit value in the base unit" do
    assert_equal 0.001, 1.g
    assert_equal 1000, 1.km
  end
  
  should "convert value from base unit to any other unit" do
    assert_equal 1000, 1.kg.to_g
    assert_equal 100, 1.m.to_cm
  end
  
  should "convert value between arbitrary units" do
    assert_equal 1, 1000.mg.to_g
    assert_equal 10, 1.cm.to_mm
  end
end