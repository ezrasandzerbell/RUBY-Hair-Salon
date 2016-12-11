require('rspec')
require('pry')
require('pg')
require('stylist')
require('client')

DB = PG.connect({:dbname => 'hair_salon_test_1'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM stylists *;')
    DB.exec('DELETE FROM clients *;')
  end
end
