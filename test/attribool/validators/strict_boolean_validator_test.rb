# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/strict_boolean_validator"

module Attribool::Validators
  class StrictBooleanValidatorTest < Test::Unit::TestCase
    def setup
      @validator = Attribool::Validators::StrictBooleanValidator
      @validator_sym = :strict_boolean
      @valid_argument_permutations = [
        [true, false],
        [:test, false],
        [true, true],
        [false, true]
      ]
      @invalid_argument_permutations = [
        [:test, true]
      ]
      @error_class = ArgumentError
    end

    def test_initialize
      assert_nothing_raised do
        @validator.new(*@valid_argument_permutations.first)
      end
    end

    def test_validate
      @valid_argument_permutations.each do |args|
        assert_nothing_raised { Attribool::ValidatorService.call(@validator_sym, *args) }
        assert(@validator.new(*args).valid?)
      end

      @invalid_argument_permutations.each do |args|
        assert_raise(@error_class) { Attribool::ValidatorService.call(@validator_sym, *args) }
        refute(@validator.new(*args).valid?)
      end
    end

    def test_error
      assert_kind_of(
        @error_class,
        @validator.new(*@valid_argument_permutations.first).error
      )
    end
  end
end
