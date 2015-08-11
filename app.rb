require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end

post("/tamagotchi") do
  name = params.fetch('name')
  @tamagotchi = Tamagotchi.new(name)
  @name = @tamagotchi.name()
  @food_level = @tamagotchi.food_level()
  @happiness_level = @tamagotchi.happiness_level()
  @energy_level = @tamagotchi.energy_level()
  erb(:tamagotchi)
end

get("/tamagotchi") do
  Tamagotchi.check_time()
  erb(:tamagotchi)
end
