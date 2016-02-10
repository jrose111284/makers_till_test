Till tech test
==============

# My Approach Version 1
in terminal

```
git clone git@github.com:jrose111284/makers_till_test.git
bundle
```

in irb
```
require './lib/checkout'
co = Checkout.new('./hipstercoffee.json')
co.scan("Cappucino")
co.total
 => 3.85
 co.tax
  => 4.25
```

I used the json to store all coffee items, and work out of tax. This allowed me to keep my class free of hard coded itegers. So you can work out total price before adding tax to total order and once order is complete, then you add the tax.

#Version 2

```
require './lib/checkout'
co = Checkout.new('./hipstercoffee.json')
co.scan("Cappucino") *7
co.tax
=> 58.15
co.apply_discount
=> 57.25
```
Needs refactoring also need to amend percentage.
*Instructions*: Please fork this repo and submit a pull request once you've finished. Then prepare for code review!

![a till](/images/till.jpg)

We want to sell tills to local hipster coffee shop who are finally embracing the 21st century. We need a new till to replace their vintage machines - unfortunately, hipster staff are too cool to learn a new system, so we need you to build something that they will understand.

Specification
-------------

This is what a sample receipt looks like:

![a receipt](/images/receipt.jpg)


Version 1
---------

Implement a system that contains the business logic to produce receipts similar to this, based on a `json` price list and test orders. A sample `.json` file has been provided with the list of products sold at this particular coffee shop.

Here are some sample orders you can try - whether you use this information is up to you:

> **Jane**  
> 2 x Cafe Latte  
> 1 x Blueberry Muffin  
> 1 x Choc Mudcake  
>
> **John**  
> 4 x Americano  
> 2 x Tiramisu  
> 5 x Blueberry Muffin  

Your receipt must calculate and show the correct amount of tax (in this shop's case, 8.64%), as well as correct line totals and total amount. Do not worry about calculating discounts or change yet. Consider what output formats may be suitable.

Version 2
---------

- Add functionality to take payment and calculate correct change.  
- Add functionality to handle discounts - in this example, a 5% discount on orders over $50, and a 10% muffin discount.

Version 3
---------

Implement an user interface that can actually be used as a till.

You may use whatever technologies you see fit.
