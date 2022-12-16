# frozen_string_literal: true

module Attribool
  ##
  # Enumerable class that generates a list of attributes from a list of strings
  # or symbols.
  class AttributeList
    include Enumerable

    ##
    # Generate the list.
    #
    # @param [String, Symbol] *attributes
    #
    # @kwarg [nil, String, Symbol, Proc] method_name
    def initialize(*attributes, method_name: nil)
      @entries = attributes.map { |a| Attribool::Attribute.new(a, method_name) }
    end

    ##
    # Yield every entry in the list to a block.
    #
    # @param [block] &block
    #
    # @return [Enumerable]
    def each(&block)
      @entries.each(&block)
    end
  end
end
