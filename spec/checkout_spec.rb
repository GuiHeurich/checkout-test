require 'checkout'

describe Checkout do

  let(:promotional_rules) { ["def a() @total = @total * 0.9 if @total > 60 end"]}
  subject(:co) { described_class.new(promotional_rules) }

  describe "#scan" do
    context 'when given an item' do
      it 'adds a reference to the item in the basket' do
        co.scan("001")
        expect(co.basket).to include("001")
      end
    end

    context 'when given multiple items' do
      it 'contains all of them' do
        co.scan("001")
        co.scan("002")
        co.scan("003")
        expect(co.basket.length).to eq(3)
      end
    end
  end

  describe '#total' do
    context 'when items are in the basket' do
      it 'returns the total price' do
        co.scan("001")
        expect(co.total).to eq(9.25)
      end
    end

    context 'when multiple items are in the basket' do
      it 'returns the correct total price' do
        co.scan("001")
        co.scan("002")
        expect(co.total).to eq(54.25)
      end
    end

    # Basket: 001,002,003
    # Total price expected: £66.78
    context 'when promotional_rules apply' do
      it 'calculates the correct total price accordingly' do
        co.scan("001")
        co.scan("002")
        co.scan("003")
        expect(co.total).to eq(66.78)
      end
    end

  end
end
