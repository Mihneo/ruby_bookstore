require_relative '../level1/json_reader_writer'
require_relative '../level1/cart_calculator'

class CartCalculator2 < CartCalculator
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def calculate_receipt(data_hash, book_ids)
    cart_hash = { 'total': 0, 'item_count': 0, 'cart_items': [] }

    chosen_books = select_books(data_hash, book_ids)

    unless chosen_books.nil?
      chosen_books.each do |book|
        cart_hash[:total] += book['price']
        cart_hash[:item_count] += 1
      end
      cart_hash[:cart_items].push(chosen_books)
    end
    data_hash[:cart] = cart_hash
    data_hash
  end
end

cart_calculator = CartCalculator2.instance
cart_calculator.export_receipt('../../requirements/level1/data.json', [1, 3])