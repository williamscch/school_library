# frozen_string_literal: true

require_relative './lib/book'

# this module will help preserve the data when the app is closed
module PreserveData
  def preserve_books
    book_objects = []
    @books.each do |book|
      book_obj = { title: book.title, author: book.author }
      book_objects.push(book_obj)
    end
    File.write('./data/books.json', JSON.generate(book_objects))
  end

  def preserve_persons
    persons_objects = []
    @persons.each do |person|
      person_obj = if person.instance_of?(::Student)
                     { class_name: person.class.name,
                       name: person.name, id: person.id,
                       age: person.age,
                       parent_permission: person.parent_permission,
                       classroom: person.classroom }
                   else
                     { class_name: person.class.name,
                       name: person.name, id: person.id,
                       age: person.age,
                       parent_permission: person.parent_permission,
                       specialization: person.specialization }
                   end
      persons_objects.push(person_obj)
    end
    File.write('./data/persons.json', JSON.generate(persons_objects))
  end

  def preserve_rentals
    rentals_objects = []
    @rentals.each do |rental|
      rental_obj = {
        date: rental.date,
        person: { id: rental.person.id },
        book: { title: rental.book.title }
      }
      rentals_objects.push(rental_obj)
    end
    File.write('./data/rentals.json', JSON.generate(rentals_objects))
  end
end

# this module will help laod the data when the app is open the first time
module LoadData
  def load_books
    if File.exist?('./data/books.json') && File.size('./data/books.json').positive?
      file_data = JSON.parse(File.read('./data/books.json'))
      file_data.each do |book|
        new_book = Book.new(book['title'], book['author'])
        @books << new_book
      end
    else
      ''
    end
  end

  def load_persons
    if File.exist?('./data/persons.json') && File.size('./data/persons.json').positive?
      file_data = JSON.parse(File.read('./data/persons.json'))

      file_data.each do |person|
        new_person = if person['class_name'] == 'Student'
                       Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
                     else
                       Teacher.new(person['age'], person['specialization'], person['name'], person['parent_permission'])
                     end
        @persons.push(new_person)
      end
    else
      ''
    end
  end
end
