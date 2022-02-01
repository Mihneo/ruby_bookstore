require_relative '../level1/json_reader_writer'
require_relative '../level2/cart_calculator_2'

class CartCalculator3 < CartCalculator2
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def select_books(library, book_hashes)
    selected_books = []
    book_ids = []
    book_hashes.keys.each do |symbol|
      book_ids.append(symbol.to_s.to_i)
    end

    unless book_ids.nil? || (book_ids.size == 0)
      library['books'].each do |book|
        if book_ids.include?(book['id'])
          selected_books.push(book.dup)
          selected_books.last['qty'] = book_hashes[book['id'].to_s.to_sym]
        end
      end
      selected_books
    else
      nil
    end
  end

  def calculate_receipt(data_hash, book_ids_hash)
    cart_hash = { 'total': 0, 'item_count': 0, 'cart_items': [] }

    chosen_books = select_books(data_hash, book_ids_hash)

    unless chosen_books.nil?
      chosen_books.each do |book|
        cart_hash[:total] += book['price'] * book['qty']
        cart_hash[:item_count] += book['qty']
      end
      cart_hash[:cart_items].push(chosen_books)
    end
    data_hash[:cart] = cart_hash
    data_hash
  end
end

cart_calculator = CartCalculator3.instance
cart_calculator.export_receipt('../../requirements/level3/data.json', {'1': 3, '3': 1})