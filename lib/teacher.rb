require_relative './person'

# Class Teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name, parent_permission)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
