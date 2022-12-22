# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../../../lib/attribool/validators/validator"

module Attribool::Validators
  class ValidatorTest < Test::Unit::TestCase
    class TestValidator
      include Attribool::Validators::Validator
    end

    def test_validate
      assert_respond_to(TestValidator, :validate)
      assert_respond_to(TestValidator.new, :validate)
    end
  end
end
