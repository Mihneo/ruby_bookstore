require_relative 'cart'
require_relative 'library'
require_relative 'printer'

FILE = '../../requirements/level1/data.json'

library = Library.new(FILE)

cart = Cart.new
cart.add_item(library.find_book_by_id(1))
cart.add_item(library.find_book_by_id(2))
cart.calculate_total_and_count

receipt = cart.generate_receipt
Printer.export_receipt(library.books, receipt)