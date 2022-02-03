require_relative 'json_reader_writer'
require_relative 'book'
require 'json'

class Cart
  attr_accessor :total, :item_count, :item_list

  def initialize
    @total = 0
    @item_count = 0
    @item_list = []
  end

  def add_item(item)
    @item_list << item if item != nil
  end

  def calculate_total
    @item_list.each do |item|
      @total += item.price
    end
  end

  def calculate_count
    @item_count = @item_list.size
  end

  def to_h
    { cart: {total: @total, item_count: @item_count } }
  end
end
