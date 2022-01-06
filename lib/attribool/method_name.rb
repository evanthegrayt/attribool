class Attribool::MethodName
  attr_reader :name

  def self.validate(method_name, number_of_attributes)
    if number_of_attributes > 1 && method_name && !method_name.is_a?(Proc)
      raise ArgumentError, "Must use a Proc when creating multiple methods"
    end
  end

  def initialize(attribute, method_name)
    @name =
      case method_name
      when Proc then method_name.call(attribute)
      when nil then "#{attribute}?"
      else method_name
      end
  end
end
