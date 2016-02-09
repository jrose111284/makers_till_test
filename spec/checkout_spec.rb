require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new( './hipstercoffee.json') }

  it 'can add price of coffee to order' do
    checkout.scan("Cafe Latte")
    expect(checkout.total).to eq(4.75)
  end
end
