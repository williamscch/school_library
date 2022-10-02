# frozen_string_literal: true

require_relative './nameable'

# Class Decorator
class Decorator < Nameable
  def initialize(nameable = Nameable.new())
    super()
    @nameable = nameable
  end

  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end

# Class to Capitalize
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

# Class to Trim
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
