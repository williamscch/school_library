# frozen_string_literal: true

# Class Classroom
class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label
  attr_reader :students

  def add_student(stud)
    @students.push(stud)
    stud.classroom = self
  end
end
