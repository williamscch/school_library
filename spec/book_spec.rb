require_relative '../lib/book'

describe Book do
  context 'Testing Book Class' do
    new_book = Book.new('The Bible', 'Jesus')
    it 'The new book should be an instace of Book class' do
      expect(new_book).to be_instance_of(Book)
    end

    it 'The new book title should be The Bible' do
      expect(new_book.title).to eq('The Bible')
    end
  end
end
