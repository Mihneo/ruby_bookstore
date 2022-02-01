require_relative '../level1/json_reader_writer'
require_relative '../level4/book2'
require_relative '../level4/cart4'

class Cart5 < Cart4
  def initialize
    super
    @sub_total = 0
    @promotion = 0
  end

  def calculate_receipt(books, book_ids_hash)
    super
    if @total > 100
      @sub_total = @total
      @promotion = (@sub_total * 0.1).to_i
      @total = @sub_total - @promotion
    end

    @json_receipt[:cart][:total] = @total
    @json_receipt[:cart][:sub_total] = @sub_total
    @json_receipt[:cart][:promotion] = @promotion
  end
end

cart_calculator = Cart5.new
cart_calculator.export_receipt('../../requirements/level5/data.json', {'1': 1, '2': 2})