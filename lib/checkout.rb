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
    @basket.each { |item| @total += @products[item]["Price"] }
    apply_promotions
    return @total.round(2)
  end

  def print_receipt
    basket_line = ["Basket: "]
    @basket.each { |item| basket_line << "#{item}," }
    total_line = "Total price expected: £#{@total.round(2)}"
    return basket_line.join("")[0...-1] + "\n" + total_line
  end

private
  def apply_promotions
    @promotional_rules.each do |method|
      # transforms each rule in a method
      Checkout.module_eval(method)
      # calls the method to alter the total
      send(method.split(" ")[1][0...-2])
    end
  end

end
