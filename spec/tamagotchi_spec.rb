require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear()
  end

  describe('#initialize') do
    it("sets the name and life levels of a new Tamagotchi") do
      tom = Tamagotchi.new("Coriander")
      expect(tom.name()).to(eq("Coriander"))
      expect(tom.food_level()).to(eq(10))
      expect(tom.happiness_level()).to(eq(10))
      expect(tom.energy_level()).to(eq(10))
    end
  end

  describe('#is_alive?') do
    it("says the Tamagotchi is alive if food level is above 0") do
      tom = Tamagotchi.new("Coriander")
      expect(tom.is_alive?()).to(eq(true))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("Evil Coriander")
      my_pet.set_food_level(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves new task with save method") do
      test_task = Tamagotchi.new("Go To School")
      test_task.save()
      expect(Tamagotchi.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it("empties all of the saved tasks") do
      Tamagotchi.new("Go To School")
      Tamagotchi.clear()
      expect(Tamagotchi.all()).to(eq([]))
    end
  end

  describe('#time_passes') do
    it("decreases the amount of food tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("Coriander")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
    it("decreases the food level if time passed has been 1 hour") do
      my_pet = Tamagotchi.new("Coriander")
      my_pet.check_time()
      expect(my_pet.food_level()).to(eq(10))
    end
  end
end
