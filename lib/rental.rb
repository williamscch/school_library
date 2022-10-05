# Class Rental
class Rental
  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book
    @person.rentals << self
    @book.rentals << self
  end

  attr_accessor :date, :book, :person
end
