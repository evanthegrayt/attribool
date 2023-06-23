# frozen_string_literal: true

module Attribool
  ##
  # Namespace for Validators. Also provides a method for fetching a validator.
  module Validators
    module_function

    ##
    # Fetches a Validator class.
    #
    # @param [String, Symbol] validator_name
    #
    # @return [Class]
    #
    # @example
    #   Attribool::Validators.fetch(:nil_attribute)
    #   # => NilAttributeValidator
    def fetch(validator_name)
      const_get(
        "#{validator_name.to_s.split("_").map(&:capitalize).join}Validator"
      )
    end
  end
end
