require_relative 'cart'
require_relative 'library'
require_relative 'printer'

FILE = '../../requirements/level3/data.json'

library = Library.new(FILE)

cart = Cart.new
cart.add_item(library.find_book_by_id(1))
cart.add_item(library.find_book_by_id(1))
cart.add_item(library.find_book_by_id(1))
cart.add_item(library.find_book_by_id(3))

cart.prepare_items_with_qty
cart.calculate_count
cart.calculate_total

receipt = cart.to_h
Printer.export_receipt(library.books, receipt)