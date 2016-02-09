require 'json'

class Checkout

  def initialize(items_json)
    @items = JSON.parse(File.read(items_json))
    @order = []
  end

  def scan(item)
    @order << item
  end

  def total
    total_price = 0.0
    @order.each do |shop_item|
      total_price += @items[shop_item]["product_price"]
    end
    total_price
  end
end
