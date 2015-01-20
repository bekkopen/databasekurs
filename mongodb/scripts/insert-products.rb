# encoding: utf-8

require 'rubygems'
require 'mongo'
require 'json'

include Mongo

server = "localhost"
port = 27017

mongo = MongoClient.new(server, port)
$db = mongo.db('bottleo')

def dump(filename, collection)
    coll = $db.collection(collection)
    coll.drop

    File.readlines(filename).each do |line|
        item = JSON.parse(line)
        coll.insert(item)
    end
end

def dumpValidJSON(filename, collection)
    coll = $db.collection(collection)
    coll.drop

    JSON.load(IO.read(filename)).each do |item|
        coll.insert(item)
    end
end

dump('../data/vinmonopolet.json', 'products')
dumpValidJSON('../data/users.json', 'users')
