
class Book
  @@books = []
  attr_accessor :id, :title, :price

  def initialize(id, title, price)
    @id = id
    @title = title
    @price = price
  end

  def self.books
    @@books
  end

  def self.clear_books
    @@books = []
  end

  def to_hash
    hash = {}
    instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
    hash
  end
end
