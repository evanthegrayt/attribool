# frozen_string_literal: true

module Attribool::Validators
  ##
  # Ensures that if multiple attributes are being defined, and +method_name+
  # is provided, that +method_name+ is a +Proc+.
  class MethodNameValidator
    ##
    # Construct the validator.
    #
    # @param [Attribool::Attribute] *items
    def initialize(method_name, number_of_attributes)
      @method_name = method_name
      @number_of_attributes = number_of_attributes
    end

    ##
    # Is there either one attribute, or is +method_name+ +nil+ or a +Proc+?
    def valid?
      @number_of_attributes == 1 || nil_or_proc?
    end

    ##
    # The exception to raise if validations fail.
    #
    # @return [ArgumentError] the exception with message
    def error
      ArgumentError.new("Must use a Proc when creating multiple methods")
    end

    private

    def nil_or_proc? # :nodoc:
      @method_name.nil? || (@method_name.is_a?(Proc) && @method_name.arity == 1)
    end
  end
end
