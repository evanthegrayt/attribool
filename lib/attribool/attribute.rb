class Attribool::Attribute
  attr_reader :name
  attr_reader :ivar

  def initialize(attribute)
    attribute = attribute.to_s
    @ivar = attribute.start_with?('@') ? attribute : "@#{attribute}"
    @name = @ivar.delete_prefix('@')
  end
end
