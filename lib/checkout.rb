class Checkout

  attr_reader :basket

  def initialize(promotional_rules)
    @basket = []
    @products = {
      "001" => { "Name" => "Very Cheap Chair", "Price" => 9.25 },
      "002" => { "Name" => "Little Table", "Price" => 45.00 },
      "003" => { "Name" => "Funky Light", "Price" => 19.95 }
    }
    @promotional_rules = promotional_rules
  end

  def scan(item)
    @basket << item
  end

  def total
    @total = 0
    @basket.each do |item|
      @total += @products[item]["Price"]
    end
    apply_promotions
    return @total.round(2)
  end

private
  def apply_promotions
    @promotional_rules.each do |method|
      # transforms each rule in a method
      Checkout.module_eval(method)
      # calls the method to alter the total
      self.send(method.split(" ")[1][0...-2])
      end
  end

end
