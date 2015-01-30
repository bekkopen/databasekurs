# encoding: utf-8

require 'rubygems'
require 'mongo'
require 'mongo_mapper'
require 'json'
require 'benchmark'
require 'date'

include Mongo

server = "localhost"
port = 27017

mongo = MongoClient.new(server, port)
$db = mongo.db('bottleo')

def dump(filename, collection)
    coll = $db.collection(collection)
    coll.remove

    File.readlines(filename).each do |line|
        item = JSON.parse(line)
        coll.insert(item)
    end
end

def dumpValidJSON(filename, collection)
    coll = $db.collection(collection)
    coll.remove

    JSON.load(IO.read(filename)).each do |item|
        item['birthdate'] = Date.parse(item['birthdate']).to_mongo if item['birthdate']
        coll.insert(item)
    end
end

Benchmark.bm do |x|
    x.report('users') { dumpValidJSON('generated/users.json', 'users') }
    x.report('products') { dump('../data/vinmonopolet.json', 'products') }
    x.report('carts') { dumpValidJSON('generated/carts.json', 'carts') }
end
