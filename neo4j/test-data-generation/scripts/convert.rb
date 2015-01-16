# encoding: UTF-8
require 'rubygems'
require 'csv'
require 'json'
require './dump_data'

def csv_as_objects(filename)
  lines = CSV.open(filename, 'r:utf-8')

  header = lines.shift

  items = []
  lines.each do |line|
    items << Hash[header.zip line]
  end

  items
end



