require_relative '../lib/student'

describe Student do
  context 'Testing for the Student Class' do
    before(:each) do
      @student = Student.new(17, 'Maths', 'Juan', false)
    end
    it 'Should not be empty' do
      expect(@student).to_not be_nil
    end

    it ''
  end
end
