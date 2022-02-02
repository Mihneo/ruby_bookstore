class Library
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_books(books_hash)
    books_hash.transform_keys(&:to_sym)[:books].each do |book_hash|
      book_hash = book_hash.transform_keys(&:to_sym)
      @books << Book.new(book_hash[:id], book_hash[:title], book_hash[:price])
    end
  end
end
