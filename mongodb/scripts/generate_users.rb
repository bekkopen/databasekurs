# encoding: UTF-8
require 'rubygems'
require 'faker'

def user
  name = Faker::Name.name
  {
      :name => name,
      :_id => Faker::Internet.user_name(name),
      :birthdate => Faker::Date.birthday(18),
      :email => Faker::Internet.free_email(name),
      :sex => ["male","female"].sample,
      :phone => 90000000 + (rand()* 9999999).ceil
  }
end

def user_list(count = 20)
  list = []
  count.times do
    newuser = user
    list << newuser unless list.any?{|a| a[:_id] == newuser[:_id] }
  end
  list
end
