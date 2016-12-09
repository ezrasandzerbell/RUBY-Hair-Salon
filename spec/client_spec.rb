require('spec_helper')

describe(Client) do

  before() do
    @client = Client.new(:name => "Abigail", :stylist_id => 1)
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

  describe('#save') do
    it('returns saved content from the database') do
      client1 = Client.new(:name => "biscuit", :stylist_id => 3)
      client2 = Client.new(:name => "Charlie", :stylist_id => 2)
      client2.save
      expect(Client.all).==([client2])
    end
  end
end
