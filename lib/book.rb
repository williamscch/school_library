# frozen_string_literal: true

# Class Book
class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(_rental)
    Rental.new(person, self)
  end
end
