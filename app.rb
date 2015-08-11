require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end

post("/tamagotchi") do
  name = params.fetch('name')
  @@tamagotchi = Tamagotchi.new(name)
  @@name = @@tamagotchi.name()
  @food_level = @@tamagotchi.food_level()
  @happiness_level = @@tamagotchi.happiness_level()
  @energy_level = @@tamagotchi.energy_level()
  erb(:tamagotchi)
end

get("/tamagotchi") do
  @@tamagotchi.check_time()
  @food_level = @@tamagotchi.food_level()
  @happiness_level = @@tamagotchi.happiness_level()
  @energy_level = @@tamagotchi.energy_level()
  if @food_level <= 0
    erb(:dead)
  else
    erb(:tamagotchi)
  end
end

get("/tamagotchi/feed") do
  @@tamagotchi.check_time()
  @@tamagotchi.feed()
  @food_level = @@tamagotchi.food_level()  
  @happiness_level = @@tamagotchi.happiness_level()
  @energy_level = @@tamagotchi.energy_level()
  if @food_level <= 0
    erb(:dead)
  else
    erb(:tamagotchi)
  end
end
