require_relative 'json_reader_writer'

class CartCalculator
  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def select_books(library, array_of_indices)
    selected_books = []

    unless array_of_indices.nil? || (array_of_indices.size == 0)
      library['books'].each do |book|
        if array_of_indices.include?(book['id'])
          selected_books.push(book)
        end
      end
      selected_books
    else
      nil
    end
  end

  def calculate_receipt(data_hash)
    cart_hash = { "total": 0, "item_count": 0 }

    chosen_books = select_books(data_hash, [1, 2])

    unless chosen_books.nil?
      chosen_books.each do |book|
        cart_hash[:total] += book['price']
        cart_hash[:item_count] += 1
      end
    end
    data_hash[:cart] = cart_hash
    data_hash
  end

  def export_receipt(file)
    json_reader = JsonReaderWriter.instance
    data_hash = json_reader.read_file(file)

    export_data = calculate_receipt(data_hash)

    json_reader.export_to_file(export_data)
  end
end

cart_calculator = CartCalculator.instance
cart_calculator.export_receipt('../../requirements/level1/data.json')