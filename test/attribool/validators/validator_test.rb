# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/validator"

module Attribool::Validators
  class ValidatorTest < Test::Unit::TestCase
    class TestValidator < Attribool::Validators::Validator
    end

    def setup
      @validator = Attribool::Validators::Validator
      @test_validator = TestValidator.new
    end

    def test_initialize
      assert_raise { @validator.new }
    end

    def test_valid?
      assert_raise(NoMethodError) { @test_validator.valid? }
    end

    def test_error?
      assert_raise(NoMethodError) { @test_validator.error }
    end
  end
end
