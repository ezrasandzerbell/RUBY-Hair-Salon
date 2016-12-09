class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch("id").to_i
      name = stylist.fetch("name")
      stylists.push(:name => name, :id => id)
    end
    stylists
  end

  define_method(:save) do
    id = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = id.first().fetch("id").to_i
  end

  define_method(:==) do |another_stylist|
    self.name == another_stylist.name & self.id == another_stylist.id
  end

  define_method(:find) do |id|
    found_client = nil
    Client.all.each do |client|
      if client.id == id
        found_client = client
      end
    end
    found_client
  end

end
