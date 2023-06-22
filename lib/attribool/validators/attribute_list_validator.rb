# frozen_string_literal: true

module Attribool::Validators
  ##
  # Ensures that every item is an instance of +Attribool::Attribute+.
  class AttributeListValidator
    ##
    # Construct the validator.
    #
    # @param [Attribool::Attribute] *items
    def initialize(*items)
      @items = items
    end

    ##
    # Are all items an instance of +Attribool::Attribute+?
    #
    # @return [Boolean]
    def valid?
      @items.all?(Attribool::Attribute)
    end

    ##
    # The exception to raise if validations fail.
    #
    # @return [TypeError] the exception with message
    def error
      TypeError.new("All items must be an instance of Attribool::Attribute")
    end
  end
end
