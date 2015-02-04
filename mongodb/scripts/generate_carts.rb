# encoding: UTF-8
require 'rubygems'

def purchases(item_codes, users, max_carts_per_user, max_items_per_cart)
  users.each do |user|
    user[:carts] = []
    rand(max_carts_per_user).times {
      cart = []
      item_codes.sample(rand(1..max_items_per_cart)).each do |item|
        cart << item.to_i
      end
      user[:carts] << cart
    }
  end
  users
end
