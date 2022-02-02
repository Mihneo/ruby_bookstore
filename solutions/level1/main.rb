require_relative 'cart'
require_relative 'library'
require_relative 'printer'

FILE = '../../requirements/level1/data.json'

library = Library.new(FILE)

cart = Cart.new
cart.add_item(library.books[0])
cart.add_item(library.books[1])

receipt = cart.generate_receipt(library.books)
Printer.export_receipt(receipt)