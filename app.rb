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
  stylist = Stylist.find(stylist_id)
  @clients = stylist.clients
  @stylist = stylist
  erb(:stylist_clients)
end

patch("/stylist/:id/update") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylist/:id/clients') do
  name = params.fetch("client_name")
  stylist_id = params.fetch("stylist_id").to_i
  @stylist = Stylist.find(stylist_id)
  client = Client.new(:id => nil, :name => name, :stylist_id => stylist_id)
  client.save
  @clients = Client.all
  erb(:stylist_clients)
end

get('/client/:id/edit') do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client_edit)
end

patch("/client/:id/update") do
  name = params.fetch("name")
  client = Client.find(params.fetch("id").to_i())
  client.update({:name => name})
  @clients = Client.all()
  stylist_id = params.fetch("stylist_id").to_i
  @stylist = Stylist.find(stylist_id)
  erb(:stylist_clients)
end

get('/client/:id/delete') do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete
  erb(:success_delete_client)
end

get('/stylist/:id/delete') do
  stylist_id = params.fetch("id").to_i
  stylist = Stylist.find(stylist_id)
  stylist.delete
  erb(:success_delete)
end

get('/stylist/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end
