# frozen_string_literal: true

##
# Adds macros and methods for dealing with boolean attributes.
module Attribool
  def self.included(klass) # :nodoc:
    klass.extend(ClassMethods)
  end

  ##
  # Class methods to be added to the class when included.
  module ClassMethods
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
      method ||= "#{attribute}?"
      method = "#{prefix}_#{method}" if prefix
      define_method(method) do
        ivar = instance_variable_get("@#{attribute}")
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
      define_method("#{attribute}=") do |v|
        if strict && ![TrueClass, FalseClass].include?(v.class)
          raise ArgumentError, 'Argument must be a boolean'
        end

        instance_variable_set("@#{attribute}", !!v)
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
end
