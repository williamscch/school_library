require_relative '../lib/teacher'

describe Teacher do
  context 'Testing the Teacher Class' do
    new_teacher = Teacher.new(45, 'Doctor', 'Charles Xavier', true)
    it 'Teacher class should be child of Person class' do
      expect(new_teacher).to be_kind_of(Person)
    end
    it 'Should respond to the method can_use_services?' do
      expect(new_teacher).to respond_to(:can_use_services?)
    end
    it 'Should have Doctor Specialization' do
      expect(new_teacher.specialization).to eq('Doctor')
    end
  end
end
