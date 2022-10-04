module Preserve_data
  def preserve_books
    book_objects = []
    @books.each {|book|
      book_obj = {title: book.title, author: book.author}
      book_objects.push(book_obj)
    }
    File.write('./data/book.json',JSON.generate(book_objects))
  end
end