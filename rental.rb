class Rental
  def initialize(person, book)
    @date = DateTime.now
    @person = person
    @book = book
    @person.rentals << self
    @book.rentals << self
  end
  attr_accessor :date, :book, :person
end
