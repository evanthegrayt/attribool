# frozen_string_literal: true

require_relative "attribool/version"
require_relative "attribool/attribute"

##
# Adds macros for dealing with boolean attributes.
#
# @example
#   require 'attribool'
#   class Person
#     extend Attribool
#     attr_accessor :name
#     bool_reader :name
#   ends
#   person = Person.new
#   person.name?
#   # false, because @name is nil.
#   person.name = 'John Smith'
#   person.name
#   # "John Smith"
#   person.name?
#   # true, because @name is truthy.
module Attribool
  ##
  # Creates methods that return a boolean for attributes that may or may not be
  # booleans themselves. Multiple readers can be created at once
  #
  # @param [Symbol, String] *attributes
  #
  # @kwarg [Boolean] allow_nil
  #
  # @kwarg [Proc] condition
  #
  # @kwarg [Symbol, String, Proc] method_name
  def bool_reader(*attributes, allow_nil: true, condition: nil, method_name: nil)
    Attribute.validate_method_name(method_name, attributes.size)

    attributes.map { |a| Attribute.new(a, method_name) }.each do |attribute|
      define_method(attribute.reader) do
        instance_variable_get(attribute.ivar).then do |value|
          raise TypeError, "#{attribute.ivar} is nil" if value.nil? && !allow_nil

          condition ? condition.call(value) : !!value
        end
      end
    end
  end

  ##
  # Creates a writer for boolean attributes. Always coerces to boolean based
  # on truthiness.
  #
  # @param [Symbol, String] *attributes
  #
  # @kwarg [Boolean] strict
  def bool_writer(*attributes, strict: false)
    attributes.map { |a| Attribute.new(a) }.each do |attribute|
      define_method(attribute.writer) do |v|
        if strict && ![TrueClass, FalseClass].include?(v.class)
          raise ArgumentError, "Argument must be a boolean"
        end

        instance_variable_set(attribute.ivar, !!v)
      end
    end
  end

  ##
  # Creates a simple reader and writer for booleans. This should only be used
  # when the attribute should only ever be +true+ or +false+.
  #
  # @param [Symbol, String] *attributes
  def bool_accessor(*attributes)
    bool_reader(*attributes)
    bool_writer(*attributes)
  end
end
