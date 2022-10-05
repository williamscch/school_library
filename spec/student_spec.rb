require_relative '../lib/student'

describe Student do
  context 'Testing for the Student Class' do
    before(:each) do
      @student = Student.new(17, 'Maths', 'Juan', false)
    end
    it 'Should not be empty' do
      expect(@student).to_not be_nil
    end

    it 'Should be able to use the method Play Hooky' do
      expect(@student.play_hooky).to match("¯\(ツ)/¯")
    end

    it 'Should change Partent Permission' do
      @student.parent_permission = true
      expect(@student.parent_permission).to be_truthy
    end
  end
end
