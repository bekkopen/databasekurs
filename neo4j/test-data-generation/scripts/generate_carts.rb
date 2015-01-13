# encoding: UTF-8
require 'rubygems'

def purchases(item_codes, users, number_of_carts, max_items_per_cart)
  purchases = []
  cart_id = 1
  number_of_carts.times do
    user_name = users.sample[:username]
    item_codes.sample(rand(max_items_per_cart)).each do |item|
      purchase = {
          :cart_id => cart_id,
          :username => user_name,
          :varenummer => item
      }
      purchases << purchase
    end

    cart_id += 1
  end
  purchases
end
