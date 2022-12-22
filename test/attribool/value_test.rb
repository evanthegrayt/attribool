# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/attribool/value"

module Attribool
  class ValueTest < Test::Unit::TestCase
    def test_initialize
      assert_nothing_raised { Attribool::Value.new(true) }
      assert_nothing_raised { Attribool::Value.new(true, proc {}) }
      assert_raise(ArgumentError) { Attribool::Value.new(true, true) }
    end

    def test_to_boolean
      assert_equal(true, Attribool::Value.new(true).to_boolean)
      assert_equal(true, Attribool::Value.new(:test).to_boolean)
      assert_equal(true, Attribool::Value.new("test").to_boolean)
      assert_equal(false, Attribool::Value.new(false).to_boolean)
      assert_equal(false, Attribool::Value.new(nil).to_boolean)
      assert_equal(true, Attribool::Value.new(18, ->(v) { v >= 18 }).to_boolean)
      assert_equal(false, Attribool::Value.new(18, ->(v) { v > 18 }).to_boolean)
    end
  end
end
