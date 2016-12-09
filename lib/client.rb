class Client

  attr_reader(:id, :name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      id = client.fetch("id").to_i
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i
      clients.push(:id => id, :name => name, :stylist_id => stylist_id)
    end
    clients
  end

  define_method(:save) do
    id = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id;")
    @id = id.first().fetch("id").to_i
  end

  define_method(:==) do |another_client|
    (self.name) == (another_client.name) && (self.stylist_id) == (another_client.stylist_id) && (self.id) == (another_client.id)
  end
end
