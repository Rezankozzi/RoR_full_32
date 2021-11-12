# frozen_string_literal: true

module Validation
  TYPE_FORMAT = %i[cargo passenger].freeze
  def valide?
    validate!
    true
  rescue StandardError
    false
  end
end
