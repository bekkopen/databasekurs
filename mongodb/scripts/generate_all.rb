# encoding: UTF-8
require 'rubygems'
require './generate_users'
require './dump_data'
require './convert'
require './generate_carts'

NUMBER_OF_USERS = 5000
NUMBER_OF_CARTS = 50000
MAX_NUMBER_OF_ITEMS_IN_CART = 10

users = user_list(NUMBER_OF_USERS)

vinmonopolet = csv_as_objects('../data/vinmonopolet-utf8.csv')
item_codes = vinmonopolet.map{ |item| item['Varenummer']}
purchases = purchases(item_codes, users, NUMBER_OF_CARTS, MAX_NUMBER_OF_ITEMS_IN_CART)

#dump_to_json vinmonopolet, '../../data/vinmonopolet-utf8.json'

# dump_to_csv users, '../generated/users.csv'
# dump_to_csv friendships, '../generated/friendships.csv'
# dump_to_csv purchases, '../generated/carts.csv'

dump_to_json users, 'generated/users.json'
dump_to_json purchases, 'generated/carts.json'
