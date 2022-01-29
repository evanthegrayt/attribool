# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/attribool/attribute'

class Attribool::AttributeTest < Test::Unit::TestCase
  def test_validate_method_name
    assert_nothing_raised { Attribool::Attribute.validate_method_name(:x, 1) }
    assert_nothing_raised { Attribool::Attribute.validate_method_name(nil, 2) }
    assert_nothing_raised do
      Attribool::Attribute.validate_method_name(->(x) { x }, 2)
    end
    assert_raise(ArgumentError) do
      Attribool::Attribute.validate_method_name(->() {}, 2)
    end
    assert_raise(ArgumentError) do
      Attribool::Attribute.validate_method_name(->(x, y) { "#{x}#{y}" }, 2)
    end
  end

  def test_standard_attributes
    ['name', '@name', :name, :@name].each do |name|
      Attribool::Attribute.new(name).tap do |a|
        assert_equal '@name', a.ivar
        assert_equal 'name', a.name
        assert_equal 'name=', a.writer
        assert_equal 'name?', a.reader
      end
    end
  end

  def test_with_method_name
    ['named?', :named?].each do |named|
      Attribool::Attribute.new(:name, named).tap do |a|
        assert_equal '@name', a.ivar
        assert_equal 'name', a.name
        assert_equal 'name=', a.writer
        assert_equal 'named?', a.reader
      end
    end
  end

  def test_reader_with_method_name
    Attribool::Attribute.new('name', ->(a) { "has_#{a}?"} ).tap do |a|
      assert_equal '@name', a.ivar
      assert_equal 'name', a.name
      assert_equal 'name=', a.writer
      assert_equal 'has_name?', a.reader
    end
  end
end
