require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new( './hipstercoffee.json') }

  it 'can add price of coffee to order' do
    checkout.scan("Cafe Latte")
    expect(checkout.total).to eq(4.75)
  end

  it 'can add more then one item and return total' do
    checkout.scan("Cafe Latte")
    checkout.scan("Single Espresso")
    checkout.scan("Double Espresso")
    expect(checkout.total).to eq(10.55)
  end
end
