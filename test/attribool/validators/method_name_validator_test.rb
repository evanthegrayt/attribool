# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/method_name_validator"

module Attribool::Validators
  class MethodNameValidatorTest < Test::Unit::TestCase
    def setup
      @validator = Attribool::Validators::MethodNameValidator
      @valid_argument_permutations = [
        [:x, 1],
        [nil, 2],
        [->(x) { x }, 2]
      ]
      @invalid_argument_permutations = [
        [-> {}, 2],
        [->(x, y) { "#{x}#{y}" }, 2]
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
        assert_nothing_raised { @validator.validate(*args) }
        assert_nothing_raised { @validator.new(*args).validate }
        assert(@validator.new(*args).valid?)
      end

      @invalid_argument_permutations.each do |args|
        assert_raise(@error_class) { @validator.validate(*args) }
        assert_raise(@error_class) { @validator.new(*args).validate }
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
