require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new( './hipstercoffee.json') }

 context 'when adding up coffee items' do

  it 'can add price of coffee to order with tax' do
    checkout.scan("Cafe Latte")
    expect(checkout.total).to eq(5.15)
  end

  it 'can add more then one item and return total' do
    checkout.scan("Cafe Latte")
    checkout.scan("Single Espresso")
    expect(checkout.total).to eq(7.20)
  end
 end

 context 'gives 5% discount when you spend over £50' do
   it 'will give you 5 percent off over £50 spent' do
     over_fifty
     expect(checkout.total).to eq(57.65)
   end
 end

 context 'takes cash and gives change' do
    it 'take cash' do
      expect(checkout.take_cash(10.00)).to eq(10.00)
    end

    it 'gives change cash' do
      checkout.scan("Cafe Latte")
      checkout.total
      checkout.take_cash(10.00)
      expect(checkout.give_change).to eq(4.85)
    end
  end
end
