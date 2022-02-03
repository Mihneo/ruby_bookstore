require_relative '../level3/json_reader_writer'
require_relative '../level4/book2'
require_relative '../level5/cart5'

class Cart6 < Cart5

  def export_receipt(file, book_ids)
    data_hash = JsonReaderWriter.read_file(file)
    convert_hash_to_books(data_hash)

    calculate_receipt(Book2.books, book_ids)

    change_mind({ '3': 1 }, data_hash)

    JsonReaderWriter.export_to_file(@json_receipt)
  end

  def change_mind(book_ids, data_hash)
    initialize
    convert_hash_to_books(data_hash)
    calculate_receipt(Book2.books, book_ids)
  end

  def convert_hash_to_books(data_hash)
    data_hash['books'].each do |book_hash|
      Book2.books << Book2.new(book_hash['id'], book_hash['title'], book_hash['price'], book_hash['stock'])
    end
  end
end

cart_calculator = Cart6.new
cart_calculator.export_receipt('../../requirements/level5/data.json', {'1': 1, '2': 2})