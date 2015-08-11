class Tomagachi
  define_method(:initialize) do |name|

    @name = name
    @food_level = 10
    @happiness_level = 10
    @energy_level = 10

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

end
