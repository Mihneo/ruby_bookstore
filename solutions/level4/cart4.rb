require_relative '../level3/json_reader_writer'
require_relative 'book2'
require_relative '../level3/cart3'

class Cart4 < Cart3

  def calculate_receipt(books, book_ids_hash)
    book_ids = []
    book_ids_hash.keys.each do |symbol|
      book_ids.append(symbol.to_s.to_i)
    end

    unless books.empty?
      books.each do |book|
        if book_ids.include?(book.id)
          quantity = book_ids_hash[book.id.to_s.to_sym]

          if book.stock - quantity >=0
            @json_receipt[:cart][:cart_items].push(book.to_hash)
            @json_receipt[:cart][:cart_items].last[:qty] = quantity

            @total += book.price * quantity
            @item_count += quantity
            book.stock -= quantity
          else
            puts "Book #{book.title} is out of stock."
          end
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
      Book2.books << Book2.new(book_hash['id'], book_hash['title'], book_hash['price'], book_hash['stock'])
    end

    calculate_receipt(Book2.books, book_ids)

    JsonReaderWriter.export_to_file(@json_receipt)
  end
end

cart_calculator = Cart4.new
cart_calculator.export_receipt('../../requirements/level4/data.json', {'1': 1, '2': 2})