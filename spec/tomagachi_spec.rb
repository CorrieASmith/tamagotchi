require('rspec')
require('tomagachi')

describe(Tomagachi) do
  describe('#initialize') do
    it("sets the name and life levels of a new Tomagachi") do
      tom = Tomagachi.new("Coriander")
      expect(tom.name()).to(eq("Coriander"))
      expect(tom.food_level()).to(eq(10))
      expect(tom.happiness_level()).to(eq(10))
      expect(tom.energy_level()).to(eq(10))
    end
  end

  describe('#is_alive?') do
    it("says the Tomagachi is alive if life is above 0") do
      tom = Tomagachi.new("Coriander")
      expect(tom.is_alive?()).to(eq(true))
    end
  end

end
