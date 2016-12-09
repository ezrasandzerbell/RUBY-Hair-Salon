require('spec_helper')

describe(Client) do

  before() do
    @client = Client.new({:id => nil, :name => "Abigail", :stylist_id => "1"})
  end

  describe('#all') do
    it('returns an empty array for now') do
      expect(Client.all).to(eq([]))
    end
  end
end
