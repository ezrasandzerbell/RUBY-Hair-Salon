require('spec_helper')

describe(Stylist) do

  before() do
    @stylist = Stylist.new(:id => nil, :name => "Edward Scissorhands")
  end

  describe('.all') do
    it('returns an empty array for now') do
      expect(Stylist.all).to(eq([]))
    end
  end

  describe('#name') do
    it('returns stylist name') do
      expect(@stylist.name).to(eq("Edward Scissorhands"))
    end
  end

  describe('#stylist_id') do
    it('returns id of stylist') do
      @stylist.save
      expect(@stylist.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it('tests for equivalence, omiting Class instance id') do
      stylist1 = Stylist.new(:id => 1, :name => "biscuit")
      stylist2 = Stylist.new(:id => 1, :name => "biscuit")
      expect(stylist1 == stylist2).to(eq(true))
    end
  end

  describe('#save') do
    it('returns saved content from the database') do
      stylist1 = Stylist.new(:id => 1, :name => "biscuit")
      stylist2 = Stylist.new(:id => nil, :name => "Charlie")
      stylist2.save
      expect(Stylist.all).==([stylist2])
    end
  end

  describe('.find') do
    it('finds a stylist by id') do
      stylist1 = Stylist.new(:id => nil, :name => "biscuit")
      stylist1.save
      stylist2 = Stylist.new(:id => nil, :name => "Charlie")
      stylist2.save
      expect(Stylist.find(2)).==(stylist2)
    end
  end
end
