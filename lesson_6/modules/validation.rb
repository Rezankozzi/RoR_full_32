module Validation

  def valide?
    validate!
    true
  rescue
    false
  end
end
