require_relative 'json_reader_writer'

class Library
  attr_accessor :books

  def initialize(file)
    @books = []
    books_json = JsonReaderWriter.read_file(file)
    create_books(books_json)
  end

  def create_books(books_json)
    books_json[:books].each do |book_hash|
      @books << Book.new(book_hash[:id], book_hash[:title], book_hash[:price])
    end
  end

  def find_book_by_id(id)
    @books.each do |book|
      if book.id == id
        return book
      end
    end
    nil
  end
end
