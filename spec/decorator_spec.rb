require_relative '../lib/decorator'
require_relative '../lib/person'

describe CapitalizeDecorator do
  context 'Test Capitalize decorator' do
    it 'Should return a capitalized person name' do
      new_person = Person.new(80, 'david', true)
      capitalized_decorator = CapitalizeDecorator.new(new_person)
      expect(capitalized_decorator.correct_name).to eq('David')
    end
    it 'Should return a capitalized person name' do
      new_person = Person.new(80, 'David', true)
      capitalized_decorator = CapitalizeDecorator.new(new_person)
      expect(capitalized_decorator.correct_name).to eq(new_person.name)
    end
  end
end

describe TrimmerDecorator do
  context 'Test Trimmer decorator' do
    it 'Should return a trimmered person name with at max 9 characters' do
      new_person = Person.new(80, 'Maximiliano Roberto', true)
      trimmer_decorator = TrimmerDecorator.new(new_person)
      expect(trimmer_decorator.correct_name).to eq('Maximilian')
    end
    it 'Should return the same value' do
      new_person = Person.new(80, 'Max', true)
      trimmer_decorator = TrimmerDecorator.new(new_person)
      expect(trimmer_decorator.correct_name).to eq(new_person.name)
    end
  end
end
