# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/nil_attribute_validator"

module Attribool::Validators
  class NilAttributeValidatorTest < Test::Unit::TestCase
    def setup
      @validator = Attribool::Validators::NilAttributeValidator
      @valid_argument_permutations = [
        [:@test, :test, false],
        [:@test, nil, true]
      ]
      @invalid_argument_permutations = [
        [:@test, nil, false]
      ]
      @error_class = TypeError
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
