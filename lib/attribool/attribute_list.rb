# frozen_string_literal: true

require "forwardable"

module Attribool
  ##
  # Enumerable class that generates a list of attributes from a list of strings
  # or symbols.
  class AttributeList
    include Enumerable
    extend Forwardable

    ##
    # :method: each
    # Yield every entry in the list to a block.
    #
    # @param [block] &block
    #
    # @return [Enumerable]
    def_delegators :@entries, :each

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
  end
end
