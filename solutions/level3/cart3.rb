require_relative '../level1/json_reader_writer'
require_relative '../level1/book'
require_relative '../level2/cart2'

class Cart3 < Cart2

  def calculate_receipt(books, book_ids_hash)
    book_ids = []
    book_ids_hash.keys.each do |symbol|
      book_ids.append(symbol.to_s.to_i)
    end

    unless books.empty?
      books.each do |book|
        if book_ids.include?(book.id)
          quantity = book_ids_hash[book.id.to_s.to_sym]
          @json_receipt[:cart][:cart_items].push(book.to_hash)
          @json_receipt[:cart][:cart_items].last[:qty] = quantity

          @total += book.price * quantity
          @item_count += quantity
        end

        @json_receipt[:books].append(book.to_hash)
        @json_receipt[:cart][:total] = @total
        @json_receipt[:cart][:item_count] = @item_count
      end
    end
  end
end

cart_calculator = Cart3.new
cart_calculator.export_receipt('../../requirements/level3/data.json', {'1': 3, '3': 1})