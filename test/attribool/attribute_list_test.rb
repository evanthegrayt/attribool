# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/attribool/attribute_list"

module Attribool
  class AttributeListTest < Test::Unit::TestCase
    def setup
      @list = Attribool::AttributeList.build(:one, :two, :three)
    end

    def test_each
      assert_respond_to(@list, :each)
      assert_equal(3, @list.each.size)
      assert_nothing_raised { @list.each(&:itself) }
    end

    def test_self_build
      assert_nothing_raised do
        Attribool::AttributeList.build(:one, :two, :three)
      end
      @list.entries.each do |entry|
        assert_kind_of(Attribool::Attribute, entry)
      end
    end

    def test_initialize
      assert_nothing_raised do
        Attribool::AttributeList.new(Attribool::Attribute.new(:one))
      end
      assert_raise(TypeError) do
        Attribool::AttributeList.new(:one, :two, :three)
      end
    end

    def test_enumerable
      assert_includes(@list.class.ancestors, Enumerable)
    end
  end
end
