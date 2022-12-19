# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/attribool/reader_name"

module Attribool
  class ReaderNameTest < Test::Unit::TestCase
    def setup
      @attribute_no_name = Attribool::ReaderName.new(:one, nil)
      @attribute_name = Attribool::ReaderName.new(:one, "has_one?")
      @attribute_proc = Attribool::ReaderName.new(:one, ->(a) { "has_#{a}?" })
    end

    def test_to_s
      assert_equal("one?", @attribute_no_name.to_s)
      assert_equal("has_one?", @attribute_name.to_s)
      assert_equal("has_one?", @attribute_proc.to_s)
    end
  end
end
