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
      @total += item[:price] * item[:qty]
    end
  end

  def calculate_count
    @item_list.each do |item|
      @item_count += item[:qty]
    end
  end

  def calculate_qty
    item_list_to_h.tally
  end

  def prepare_items_with_qty
    cart_items = []
    quantities = calculate_qty
    quantities.each do |item_quantity|
      item_quantity[0][:qty] = item_quantity[1]
      cart_items << item_quantity[0]
    end
    @item_list = cart_items
  end

  def to_h
    { cart: {total: @total, item_count: @item_count, cart_items: @item_list} }
  end

  def item_list_to_h
    @item_list.map(&:to_h)
  end
end
