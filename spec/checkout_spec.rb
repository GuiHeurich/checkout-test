require 'checkout'

describe Checkout do

  subject(:co) { described_class.new }

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

  # co.total
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
  end
end
