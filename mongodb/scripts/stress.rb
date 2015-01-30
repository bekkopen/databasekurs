
require 'rubygems'
require 'mongo'
require 'benchmark'

include Mongo

$server = "10.0.20.169"
$port = 27017
mongo = MongoClient.new($server, $port)

db = mongo.db('bottleo')
$coll = db['products']

def query
    skips = (1..8000).to_a.sample
    product = $coll.find(:skip=>skips, :limit=>1).to_a
    puts product[0]
end


Benchmark.bm do |x|
    while true do
        x.report('find') {
            10.times do
                query
            end
        }
    end
end
