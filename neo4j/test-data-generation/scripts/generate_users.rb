# encoding: UTF-8
require 'rubygems'
require 'faker'

def user
  name = Faker::Name.name
  {
      :name => name,
      :username => Faker::Internet.user_name(name),
      :birthdate => Faker::Date.birthday(18).to_s,
      :email => Faker::Internet.free_email(name),
      :sex => ["male","female"].sample,
      :phone => 90000000 + (rand()* 9999999).ceil
  }
end

def user_list(count = 20)
  list = []
  count.times do
    list << user
  end
  list
end

def friendships(users, avg_friendship_count = 1)
  list = []
  (avg_friendship_count * users.size).ceil.times do

    sample = users.sample(2).sort_by{|u| u[:username]}

    list << {
        :username1=>sample[0][:username],
        :username2=>sample[1][:username]
    }
  end
  list
end


