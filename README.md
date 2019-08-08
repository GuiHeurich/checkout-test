# Checkout Scan

Checkout scan puts items in a basket and calculates the total price. It also implements discounts according to the current promotional rules.

These are the current products:

| Product code | Name             | Price  |
| ------------ | ---------------- | ------ |
| 001          | Very Cheap Chair | £9.25  |
| 002          | Little table     | £45.00 |
| 003          | Funky light      | £19.95 |

These are the current promotional rules:

1. If you buy 2 or more very cheap chairs then the price drops to £8.50.
2. If you spend over £60, then you get 10% off of your purchase.

## Instructions

Clone this repo, run `bundle install` and open IRB in your terminal. Require the file `require './checkout'`, set the promotional_rules `p = <promotional_rules>` replacing the value of `p` with the methods that will change the total. Example:

```
p = ["def a() @total = @total -= 1.50 if @basket.count(\"001\") == 2 end", "def b() @total = @total * 0.9 if @total > 60 end"]
```

Create a new checkout passing the promotional_rules as an argument `co = Checkout.new(p)`.

Start scanning your items:

```
co.scan("001")
co.scan("002")
co.scan("003")
```

Calculate the total and print the receipt:

```
co.total
co.print
```

## Acceptance criteria

```
Basket: 001,002,003
Total price expected: £66.78

Basket: 001,003,001
Total price expected: £36.95

Basket: 001,002,001,003
Total price expected: £73.76
```
