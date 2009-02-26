require File.dirname(__FILE__) + '/test_helper'

class ParseTest < Test::Unit::TestCase
  should "parse a single base unit string" do
    assert_equal 1, Systeme.parse('1m')
    assert_equal 1, Systeme.parse('1 meter')
    assert_equal 1, Systeme.parse('1 meters')
    assert_equal 1, Systeme.parse('1 m')
  end

  should "parse a single non-base unit string" do
    assert_equal 1000, Systeme.parse('1km')
    assert_equal 1000, Systeme.parse('1 kilometer')
    assert_equal 1000, Systeme.parse('1 kilometers')
    assert_equal 1000, Systeme.parse('1 km')
  end

  should "parse a complex string" do
    assert_equal 1001, Systeme.parse('1km 1m')
    assert_equal 1001, Systeme.parse('1 km 1 m')
    assert_equal 1001, Systeme.parse('1kilometer1meter')
    assert_equal 1001, Systeme.parse('1 kilometer 1 meter')
  end

  should "parse a complex string with non-SI units" do
    assert_equal 1609.344, Systeme.parse('1 mile')
    assert_equal 1609.3694, Systeme.parse('1 mi 1in')
  end

  should "parse a complex string with units from different systems" do
    assert_equal 1610.344, Systeme.parse('1 mile 1m')
  end
end