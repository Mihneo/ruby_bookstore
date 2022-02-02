require_relative 'json_reader_writer'
require_relative 'book'
require 'json'

class Cart
  attr_accessor :total, :item_count

  def initialize
    @total = 0
    @item_count = 0
  end

  def add_item(book)
    @total += book.price
    @item_count += 1
  end

  def generate_receipt(books)
    parsed_books = []
    books.each do |book|
      parsed_books << book.to_json
    end
    OpenStruct.new(books: parsed_books, cart: {total: @total, item_count: @item_count }).to_h
  end
end
