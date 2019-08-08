class Checkout

  attr_reader :basket

  def initialize
    @basket = []
    @products = {
      "001" => { "Name" => "Very Cheap Chair", "Price" => 9.25 },
      "002" => { "Name" => "Little Table", "Price" => 45.00 },
      "003" => { "Name" => "Funky Light", "Price" => 19.95 }
    }
  end

  def scan(item)
    @basket << item
  end

  def total
    @total = 0
    @basket.each do |item|
      @total += @products[item]["Price"]
    end
    return @total
  end

end
