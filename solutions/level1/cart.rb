require_relative 'json_reader_writer'
require_relative 'book'
require 'json'

class Cart
  attr_accessor :total, :item_count

  def initialize
    Book.clear_books
    @total = 0
    @item_count = 0
    @json_receipt = {books: [], cart: {total: 0, item_count: 0}}
  end


  def calculate_receipt(books, book_ids)
    unless books.empty?
      books.each do |book|
        if book_ids.include?(book.id)
          @total += book.price
          @item_count += 1
        end

        @json_receipt[:books].append(book.to_hash)
        @json_receipt[:cart][:total] = @total
        @json_receipt[:cart][:item_count] = @item_count
      end
    end
  end

  def export_receipt(file, book_ids)
    data_hash = JsonReaderWriter.read_file(file)
    data_hash['books'].each do |book_hash|
      Book.books << Book.new(book_hash['id'], book_hash['title'], book_hash['price'])
    end

    calculate_receipt(Book.books, book_ids)

    JsonReaderWriter.export_to_file(@json_receipt)
  end
end

cart_calculator = Cart.new
cart_calculator.export_receipt('../../requirements/level1/data.json', [1, 2])