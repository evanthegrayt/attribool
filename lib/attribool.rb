# frozen_string_literal: true

require_relative 'attribool/version'

##
# Adds macros and methods for dealing with boolean attributes.
module Attribool
  ##
  # Creates a method that returns a boolean for attributes that may or may
  # not be booleans themselves.
  #
  # @param [Symbol, String] attribute
  #
  # @kwarg [Boolean] allow_nil:
  #
  # @kwarg [Lambda] condition:
  #
  # @kwarg [Symbol, String] method:
  #
  # @kwarg [Symbol, String] prefix:
  def bool_reader(
    attribute,
    allow_nil: true,
    condition: nil,
    prefix: nil,
    method: nil
  )
    attribute = attribute.to_s
    attribute = attribute.start_with?('@') ? attribute : "@#{attribute}"
    method ||= "#{attribute.delete_prefix('@')}?"
    method = "#{prefix}_#{method}" if prefix
    define_method(method) do
      ivar = instance_variable_get(attribute)
      raise TypeError, "#{attribute} is nil" if ivar.nil? && !allow_nil

      condition ? condition.call(ivar) : !!(ivar)
    end
  end

  ##
  # Creates a writer for boolean attributes. Always coerces to boolean based
  # on truthiness.
  #
  # @param [Symbol, String] attribute
  #
  # @kwarg [Boolean] strict:
  def bool_writer(attribute, strict: false)
    attribute = attribute.to_s
    attribute = attribute.start_with?('@') ? attribute : "@#{attribute}"
    define_method("#{attribute.delete_prefix('@')}=") do |v|
      if strict && ![TrueClass, FalseClass].include?(v.class)
        raise ArgumentError, 'Argument must be a boolean'
      end

      instance_variable_set(attribute, !!v)
    end
  end

  ##
  # Creates a simple reader and writer for booleans. This should only be used
  # when the attribute should only ever be +true+ or +false+.
  #
  # @param [Symbol, String] attribute
  def bool_accessor(attribute)
    bool_reader(attribute)
    bool_writer(attribute)
  end
end
