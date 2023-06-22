# frozen_string_literal: true

module Attribool::Validators
  class AttributeListValidator
    def initialize(*items)
      @items = items
    end

    def valid?
      @items.all?(Attribool::Attribute)
    end

    def error
      TypeError.new("All items must be an instance of Attribool::Attribute")
    end
  end
end
