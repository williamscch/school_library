require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age, :rentals
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(_rental)
    Rental.new(book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
