require_relative '../level2/book'

class Book2 < Book
  @@books = []
  attr_accessor :stock

  def initialize(id, title, price, stock)
    @id = id
    @title = title
    @price = price
    @stock = stock
  end
end
