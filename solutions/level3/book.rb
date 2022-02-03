require 'ostruct'

class Book
  attr_accessor :id, :title, :price

  def initialize(id, title, price)
    @id = id
    @title = title
    @price = price
  end

  def to_h
    { id: @id, title: @title, price: @price }
  end
end