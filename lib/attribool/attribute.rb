##
# Abstraction for an attribute to determine its name, reader, writer, and
# instance variable name.
class Attribool::Attribute
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
  # Ensures that if multiple attributes are being defined, and +method_name+ is
  # provided, that +method_name+ is a +Proc+.
  #
  # @param [Integer] number_of_attributes
  #
  # @param [String, Symbol, Proc] method_name
  def self.validate_method_name(number_of_attributes, method_name)
    if number_of_attributes > 1 && method_name && !method_name.is_a?(Proc)
      raise ArgumentError, "Must use a Proc when creating multiple methods"
    end
  end

  ##
  # Create an Attribute. The attribute can either be a String or a Symbol, and
  # can also start with an "@", or not.
  #
  # @param [String, Symbol] attribute
  #
  # @param [String, Symbol, Proc, nil] reader_name
  def initialize(attribute, reader_name = nil)
    attribute.to_s.tap do |a|
      @ivar = a.start_with?('@') ? a : "@#{a}"
      @name = @ivar.delete_prefix('@')
      @reader =
        case reader_name
        when Proc then reader_name.call(name)
        when nil then "#{name}?"
        else reader_name.to_s
        end
      @writer = "#{name}="
    end
  end
end
