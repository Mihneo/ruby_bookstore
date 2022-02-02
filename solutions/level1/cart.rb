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

  def calculate_total_and_count
    @item_list.each do |item|
      @total += item.price
      @item_count += 1
    end
  end

  def generate_receipt
    { cart: {total: @total, item_count: @item_count } }
  end
end
