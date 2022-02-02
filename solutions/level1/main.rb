require_relative 'cart'
require_relative 'library'
require_relative 'book_serializer'

FILE = '../../requirements/level1/data.json'

library = Library.new
books_hash = JsonReaderWriter.read_file(FILE)
library.create_books(books_hash)

cart = Cart.new
cart.calculate_totals(library.books, [1, 2])
receipt = cart.generate_receipt(library.books)
cart.export_receipt(receipt)