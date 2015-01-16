# encoding: UTF-8
require 'rubygems'
require 'csv'
require 'json'

def dump_to_csv(items, filename = 'data.csv')
  puts "Dumping #{items.size} items as CSV to #{filename}"
  CSV.open(filename, 'w:utf-8') do |csv|
    csv << items.first.keys
    items.each do |user|
      csv << (user.values)
    end
  end
end

def dump_to_json(items, filename = 'data.json')
  puts "Dumping #{items.size} items as JSON to #{filename}"
    File.open(filename, 'w:utf-8') do |file|
      file << items.to_json
    end
end
