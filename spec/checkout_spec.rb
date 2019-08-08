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
