require_relative 'json_reader_writer'

class Library
  attr_accessor :books

  def initialize(file)
    @books = []
    books_hash = JsonReaderWriter.read_file(file)
    create_books(books_hash)
  end

  def create_books(books_hash)
    books_hash[:books].each do |book_hash|
      @books << Book.new(book_hash[:id], book_hash[:title], book_hash[:price])
    end
  end
end
