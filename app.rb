require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pry')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = []
  erb(:index)
end

post('/stylist') do
  name = params.fetch("name")
  stylist = Stylist.new(:name => name)
  stylist.save
  @sylists - Stylist.all
  erb(:index)
end
