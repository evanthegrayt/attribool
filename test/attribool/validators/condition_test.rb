# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/condition_validator"

module Attribool::Validators
  class ConditionTest < Test::Unit::TestCase
    def setup
      @validator = Attribool::Validators::ConditionValidator
      @validator_sym = :condition
      @valid_argument_permutations = [
        [nil],
        [proc {}]
      ]
      @invalid_argument_permutations = [
        [:x]
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
