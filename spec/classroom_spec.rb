require_relative '../lib/classroom'
require_relative '../lib/student'

describe Classroom do
  context 'Testing Classroom Class' do
    new_classroom = Classroom.new('Math')
    student = Student.new(16, '', 'Pedro', true)

    it 'The new Classroom should be an instace of Classroom class' do
      expect(new_classroom).to be_instance_of(Classroom)
    end

    it 'The new classroom label should be Math' do
      expect(new_classroom.label).to eq('Math')
    end

    it 'should have a new student' do
      new_classroom.add_student(student)
      expect(new_classroom.students.length).to eq(1)
    end
  end
end
