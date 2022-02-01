require_relative '../level1/json_reader_writer'
require_relative '../level1/book'
require_relative '../level1/cart'

class Cart2 < Cart

  def initialize
    Book.clear_books
    @total = 0
    @item_count = 0
    @json_receipt = {books: [], cart: {total: 0, item_count: 0, cart_items: []}}
  end


  def calculate_receipt(books, book_ids)
    unless books.empty?
      books.each do |book|
        if book_ids.include?(book.id)
          @total += book.price
          @item_count += 1
          @json_receipt[:cart][:cart_items].push(book.to_hash)
        end

        @json_receipt[:books].append(book.to_hash)
        @json_receipt[:cart][:total] = @total
        @json_receipt[:cart][:item_count] = @item_count
      end
    end
  end
end

cart_calculator = Cart2.new
cart_calculator.export_receipt('../../requirements/level1/data.json', [1, 3])