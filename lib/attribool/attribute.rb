# frozen_string_literal: true

module Attribool
  ##
  # Abstraction for an attribute to determine its name, reader, writer, and
  # instance variable name.
  class Attribute
    ##
    # The name of the attribute, without the leading "@".
    #
    # @return [String]
    attr_reader :name

    ##
    # The name of the instance variable for the attribute, with the leading "@".
    #
    # @return [String]
    attr_reader :ivar

    ##
    # The name of the reader for the attribute.
    #
    # @return [String]
    attr_reader :reader

    ##
    # The name of the writer for the attribute.
    #
    # @return [String]
    attr_reader :writer

    ##
    # Create an Attribute. The attribute can either be a String or a Symbol.
    #
    # @param [String, Symbol] attribute
    #
    # @param [String, Symbol, Proc, nil] reader_name
    def initialize(attribute, reader_name = nil)
      attribute.to_s.then do |a|
        @name = a
        @ivar = "@#{a}"
        @reader = Attribool::ReaderName.new(name, reader_name).to_s
        @writer = "#{name}="
      end
    end
  end
end
