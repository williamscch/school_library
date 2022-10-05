require_relative '../lib/rental'
require_relative '../lib/student'
require_relative '../lib/book'

describe Rental do
  context 'Test rental class' do
    person = Person.new(80, 'David', true)
    book = Book.new('The Lord of the Rings', 'Paulo Kohelo')
    rental = Rental.new(person, book, '25/12/2015')

    it 'Instance of rental is a rental class' do
      expect(rental).to be_instance_of(Rental)
    end

    it 'Rental date should be 25/12/2015' do
      expect(rental.date).to eq('25/12/2015')
    end

    it 'Person is expected to have rental' do
      expect(rental.person.rentals.length).to eq(1)
    end
  end
end
