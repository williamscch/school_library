# frozen_string_literal: true

require_relative './person'

# Class Teacher
class Teacher < Person
  def initialize(age, specialization, name, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
