# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/attribool/attribute"

module Attribool
  class AttributeTest < Test::Unit::TestCase
    def test_standard_attributes
      ["name", :name].each do |name|
        Attribool::Attribute.new(name).then do |a|
          assert_equal "@name", a.ivar
          assert_equal "name", a.name
          assert_equal "name=", a.writer
          assert_equal "name?", a.reader
        end
      end
    end

    def test_with_method_name
      ["named?", :named?].each do |named|
        Attribool::Attribute.new(:name, named).then do |a|
          assert_equal "@name", a.ivar
          assert_equal "name", a.name
          assert_equal "name=", a.writer
          assert_equal "named?", a.reader
        end
      end
    end

    def test_reader_with_method_name
      Attribool::Attribute.new("name", ->(a) { "has_#{a}?" }).then do |a|
        assert_equal "@name", a.ivar
        assert_equal "name", a.name
        assert_equal "name=", a.writer
        assert_equal "has_name?", a.reader
      end
    end
  end
end
