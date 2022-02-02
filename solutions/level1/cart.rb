require_relative 'json_reader_writer'
require_relative 'book'
require 'json'

class Cart
  attr_accessor :total, :item_count

  def initialize
    @total = 0
    @item_count = 0
  end


  def calculate_totals(books, book_ids)
    unless books.empty?
      books.each do |book|
        if book_ids.include?(book.id)
          @total += book.price
          @item_count += 1
        end
      end
    end
  end

  def generate_receipt(books)
    books = BookSerializer.serialize_books(books)
    OpenStruct.new(books: books, cart: {total: @total, item_count: @item_count }).to_h
  end

  def export_receipt(json)
    JsonReaderWriter.export_to_file(json)
  end
end
