# encoding: UTF-8
require 'rubygems'
require './generate_users'
require './dump_data'
require './convert'
require './generate_carts'

NUMBER_OF_USERS = 1500
NUMBER_OF_FRIENDS_PER_USER = 25
NUMBER_OF_CARTS = 5000
MAX_NUMBER_OF_ITEMS_IN_CART = 10

users = user_list(NUMBER_OF_USERS)
friendships = friendships(users, NUMBER_OF_FRIENDS_PER_USER)

item_codes = csv_as_objects('../../data/vinmonopolet.csv').map{ |item| item['Varenummer']}
purchases = purchases(item_codes, users, NUMBER_OF_CARTS, MAX_NUMBER_OF_ITEMS_IN_CART)

dump_to_csv users, '../generated/users.csv'
dump_to_csv friendships, '../generated/friendships.csv'
dump_to_csv purchases, '../generated/carts.csv'