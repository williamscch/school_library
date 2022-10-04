# frozen_string_literal: true

require_relative './lib/app'
require_relative './lib/utilities'

# Class Main
class Main
  def initialize
    @app = App.new
  end

  # Method Main for entry point
  def print_main_menu
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1- List all books'
    puts '2- List all people'
    puts '3- Create a person'
    puts '4- Create a book'
    puts '5- Create a rental'
    puts '6- List all rentals for a given person id'
    puts '7- Exit'
  end

  def welcome
    puts 'Welcome to School Library App!'
    puts ''
  end

  def choosed_option(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals
    end
  end

  def main
    welcome
    loop do
      print_main_menu
      option_validated = Utilities.validate_input(1, 7)

      if option_validated == 7
        @app.preserve_data
        @app.get_data
        break
      end

      next unless option_validated

      choosed_option(option_validated)
    end
    puts 'Good Bye'
  end
end

Main.new.main
