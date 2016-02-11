require 'json'

class Checkout
  DISCOUNT = 50
  def initialize(items_json)
    @items = JSON.parse(File.read(items_json))
    @order = []
    @balance = 0
  end

  def scan(item)
    @order << item
  end

  def total
    total_price = 0.0
    @order.each do |shop_item|
      total_price += @items[shop_item]["product_price"]
    end
    total_price.round(2)
  end

  def tax
    tax_percentage = @items["tax"]["tax_total"]
    total + tax_percentage
  end

  def apply_discount
    discount_percentage = @items["discount_5%"]["discount_percentage"]
    five_percent_off = total - discount_percentage
    five_percent_off if total > DISCOUNT
  end

  def add_funds(amount)
    @balance += amount
  end
end
