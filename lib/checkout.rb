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
    totals = total_price += tax
    totals -= @items["discount_5%"]["discount_percentage"] if totals > DISCOUNT
    totals.round(2)
  end

  def tax
    @items["tax"]["tax_total"]
  end

  def take_cash(amount)
    @balance += amount
  end

  def give_change
    @balance -= total
  end
end
