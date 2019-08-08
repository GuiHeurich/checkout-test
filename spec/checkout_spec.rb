require 'checkout'

describe Checkout do

  subject(:co) { described_class.new }

  # co.scan("001")
  describe "#scan" do
    context 'when given an item' do
      it 'adds a reference to the item in the basket' do
        co.scan("001")
        expect(co.basket).to include("001")
      end
    end
  end
end
