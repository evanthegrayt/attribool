# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/attribool/validator_service"

module Attribool::Validators
  class TestTrueValidator
    def valid?
      true
    end

    def error
      StandardError.new("TEST ERROR")
    end
  end

  class TestFalseValidator
    def valid?
      false
    end

    def error
      StandardError.new("TEST ERROR")
    end
  end
end

module Attribool
  class ValidatorServiceTest < Test::Unit::TestCase
    def setup
      @validator = Attribool::ValidatorService
    end

    def test_call
      assert_nothing_raised { @validator.call(:test_true) }
      assert_raise(StandardError) { @validator.call(:test_false) }
    end
  end
end
