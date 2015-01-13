# encoding: UTF-8
require 'rubygems'
require 'csv'
require 'json'
require './dump_data'

def csv_as_objects(filename)
  items = []
  lines = CSV.read(filename,'r')
  header = lines.shift

  lines.each do |line|
    items << Hash[header.zip line]
  end

  items
end



