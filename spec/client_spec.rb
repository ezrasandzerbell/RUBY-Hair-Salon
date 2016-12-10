require('spec_helper')

describe(Client) do

  before() do
    @client = Client.new(:id => nil, :name => "Abigail", :stylist_id => 1)
  end

  describe('#all') do
    it('returns an empty array for now') do
      expect(Client.all).to(eq([]))
    end
  end

  describe('#name') do
    it('returns client name') do
      expect(@client.name).to(eq("Abigail"))
    end
  end

  describe('#stylist_id') do
    it('returns id of clients stylist') do
      expect(@client.stylist_id).to(eq(1))
    end
  end

  describe('#==') do
    it('tests for equivalence, omiting Class instance id') do
      client1 = Client.new(:id => nil, :name => "biscuit", :stylist_id => 3)
      client2 = Client.new(:id => nil, :name => "biscuit", :stylist_id => 3)
      expect(client1 == client2).to(eq(true))
    end
  end

  describe('#save') do
    it('returns saved content from the database') do
      client1 = Client.new(:id => nil, :name => "biscuit", :stylist_id => 3)
      client2 = Client.new(:id => nil, :name => "Charlie", :stylist_id => 2)
      client2.save
      expect(Client.all).==([client2])
    end
  end

  describe('#id') do
    it('tests for id of a client') do
      client1 = Client.new(:id => nil, :name => "biscuit", :stylist_id => 3)
      client1.save
      client2 = Client.new(:id => nil, :name => "biscuit", :stylist_id => 3)
      client2.save
      client2_id = client2.id.to_i
      expect(client2_id).to(be_an_instance_of(Fixnum))
    end
  end
end
