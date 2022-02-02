require 'ostruct'

class BookSerializer
  attr_accessor :id, :title, :price

  def self.serialize_books(books)
    books_hash = []
    books.each do |book|
      books_hash << OpenStruct.new(id: book.id, title: book.title, price: book.price).to_h
    end
    books_hash
  end
end
