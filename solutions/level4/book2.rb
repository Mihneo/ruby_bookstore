require_relative '../level1/book'

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
