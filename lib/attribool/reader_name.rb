# frozen_string_literal: true

module Attribool
  ##
  # Abstraction of a reader's method name.
  class ReaderName
    ##
    # Instantiate new instance of ReaderName.
    #
    # @param [String, Syumbol] attribute
    #
    # @param [proc, nil, String, Symbol] name
    def initialize(attribute, name)
      @attribute = attribute
      @name = name
    end

    ##
    # Convert instance to a string.
    #
    # @return [String]
    def to_s
      case @name
      when Proc then @name.call(@attribute)
      when nil then "#{@attribute}?"
      else @name.to_s
      end
    end
  end
end
