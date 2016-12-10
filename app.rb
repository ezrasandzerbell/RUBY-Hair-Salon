require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pry')
require('pg')

DB = PG.connect({:dbname => "hair_salon_test_1"})



get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  name = params.fetch("stylist_name")
  stylist = Stylist.new(:id => nil, :name => name)
  stylist.save
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist/:id') do
  stylist_id = params.fetch("id").to_i
  @stylist = Stylist.find(stylist_id)
  erb(:stylist_clients)
end

post('/client') do
  name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i
  @stylist = Stylist.find(stylist_id)
  client = Client.new(:name => name, :stylist_id => stylist_id)
  client.save
  erb(:stylist_clients)
end

get('/stylist/:id/delete') do
  stylist_id = params.fetch("id").to_i
  stylist = Stylist.find(stylist_id)
  stylist.delete
  erb(:success_delete)
end

get('/stylist/:id/update') do
  stylist_id = params.fetch("id").to_i
  @stylist = Stylist.find(stylist_id)
  erb(:success_update)
end
