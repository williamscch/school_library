require_relative './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom) 
  @classroom = classroom

  @classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
