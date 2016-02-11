require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new( './hipstercoffee.json') }

 context 'when adding up coffee items before tax' do

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

 context 'when adding up coffee items with tax' do
   it 'can add price of coffee to order and apply tax' do
     checkout.scan("Cafe Latte")
     checkout.total
     expect(checkout.tax).to eq(5.15)
   end
 end

 context 'gives 5% discount when you spend over £50' do
   it 'will give you 5 percent off over £50 spent' do
     over_fifty
     checkout.total
     checkout.tax
     expect(checkout.apply_discount).to eq(57.25)
   end
 end

 context 'takes cash and gives change' do
    it 'take cash' do
      expect(checkout.add_funds(10.00)).to eq(10.00)
    end
  end
end
