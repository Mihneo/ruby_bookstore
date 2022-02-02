require 'ostruct'

class Book
  attr_accessor :id, :title, :price

  def initialize(id, title, price)
    @id = id
    @title = title
    @price = price
  end

  def to_json
     OpenStruct.new(id: @id, title: @title, price: @price).to_h
  end
end
