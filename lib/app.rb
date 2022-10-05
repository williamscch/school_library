# frozen_string_literal: true

require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'rental'
require_relative 'utilities'
require_relative 'classroom'
require 'json'
require_relative '../manipulate_data'
# Class App
class App
  include LoadData
  include PreserveData
  def initialize
    @persons = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Joe Classroom')
  end

  def list_all_books
    @books.each do |b|
      puts "Title: '#{b.title}', Author: '#{b.author}'"
    end
  end

  def list_all_persons
    @persons.each do |p|
      print "[#{p.class.name}] "
      print "Name: #{p.name} "
      print "ID: #{p.id} "
      print "Age: #{p.age}\n"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    option_validated = Utilities.validate_input(1, 2)
    create_student if option_validated == 1
    create_teacher if option_validated == 2
  end

  def create_student
    age = Utilities.get_input('Age')
    name = Utilities.get_input('Name')
    parent_permission = Utilities.get_input('Has parent permission? [Y/N]')

    @persons.push(Student.new(age, @classroom, name, parent_permission))
    puts 'Person Created Succesfully'
  end

  def create_teacher
    age = Utilities.get_input('Age')
    name = Utilities.get_input('Name')
    specialization = Utilities.get_input('Specialization')

    @persons.push(Teacher.new(age, specialization, name, true))
    puts 'Person Created Succesfully'
  end

  def create_book
    title = Utilities.get_input('Title')
    author = Utilities.get_input('Author')

    @books.push(Book.new(title, author))
    puts 'Book Created Succesfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |b, i|
      puts "#{i}) Title: '#{b.title}', Author: '#{b.author}'"
    end
    selected_book = Utilities.validate_input(0, @books.length - 1)
    puts 'Select a person from the following list by number'
    @persons.each_with_index do |p, i|
      puts "#{i}) [#{p.class.name}] Name: #{p.name} ID: #{p.id} Age: #{p.age}\n"
    end
    selected_person = Utilities.validate_input(0, @persons.length - 1)
    date = Utilities.get_input('Date')
    @rentals.push(Rental.new(@persons[selected_person], @books[selected_book], date))
    puts 'Rental Created Succesfully'
  end

  def list_all_rentals
    input_person_id = Utilities.get_input('ID of Person')
    puts 'Rentals:'
    @rentals.each do |r|
      next unless r.person.id.to_i == input_person_id.to_i

      print "Date: #{r.date}, "
      print "Book: \"#{r.book.title}\" "
      print "by #{r.book.author}\n"
    end
  end

  def save_data
    preserve_books
    preserve_rentals
    preserve_persons
  end

  def fetch_data
    load_books
    load_persons
  end
end
