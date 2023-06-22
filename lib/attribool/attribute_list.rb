# frozen_string_literal: true

module Attribool
  ##
  # Enumerable class that generates a list of attributes from a list of strings
  # or symbols.
  class AttributeList
    include Enumerable

    ##
    # Create an +AttributeList+ from a list of attribute names.
    #
    # @param [String, Symbol] *attribute_names
    #
    # @kwarg [nil, String, Symbol, Proc] method_name
    #
    # @return [AttributeList]
    def self.build(*attribute_names, method_name: nil)
      new(*attribute_names.map { |a| Attribool::Attribute.new(a, method_name) })
    end

    ##
    # Construct the list.
    #
    # @param [String, Symbol] *attributes
    def initialize(*attributes)
      ValidatorService.call(:attribute_list, *attributes)
      @entries = attributes
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
