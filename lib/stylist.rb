class Stylist

  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch("id").to_i
      name = stylist.fetch("name")
      stylists.push(Stylist.new({:id => id, :name => name}))
    end
    stylists
  end

  define_method(:save) do
    id = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = id.first().fetch("id").to_i
  end


  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id() == id
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:==) do |another_stylist|
    self.id == another_stylist.id && self.name == another_stylist.name
  end


end
