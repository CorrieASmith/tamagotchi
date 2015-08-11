class Tamagotchi
  @@tamagotchis = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @happiness_level = 10
    @energy_level = 10
    @time_fed = Time.new
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:happiness_level) do
    @happiness_level
  end

  define_method(:energy_level) do
    @energy_level
  end

  define_method(:is_alive?) do
    if food_level() <= 0
      false
    else
      true
    end
  end

  define_method(:set_food_level) do |level|
    @food_level = level
  end

  define_method(:time_passes) do
    @food_level -= 1
  end

  define_method(:check_time) do
    now = Time.new
    time_passed = now - @time_fed
    i = 10
    until i > time_passed
      time_passes()
      i += 10
    end
  end

  define_singleton_method(:all) do
    @@tamagotchis
  end

  define_method(:save) do
    @@tamagotchis.push(self)
  end

  define_singleton_method(:clear) do
    @@tamagotchis = []
  end
end
