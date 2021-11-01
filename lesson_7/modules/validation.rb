module Validation
  TYPE_FORMAT = [:cargo, :passenger]
  def valide?
    validate!
    true
  rescue
    false
  end
end
