require_relative '../lib/person'

describe Person do
  context 'Testing Book Class' do
    new_person = Person.new(57, 'Jessiel', true)
    it 'The new person should be an instace of Person class' do
      expect(new_person).to be_instance_of(Person)
    end

    it 'The new Person name should be Jessie' do
      expect(new_person.name).to eq('Jessiel')
    end

    it 'The new person age should be 57' do
      expect(new_person.age).to be(57)
    end
  end
end
