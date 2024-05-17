# just getting some access to free pokemon api
# What version was the pokemon in?
require "http"

def which_version()
  poke_list = (HTTP.get("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0").parse)["results"].map {|species| species["name"]}
  
  n = true
  while n == true
    p "Choose a pokemon: "
    pokemon = gets.chomp.downcase
    if poke_list.include?(pokemon)
      n = false
    else
      p "Please try another pokemon" 
    end
  end
  versions_appeared = (HTTP.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}/").parse)["game_indices"].map {|element| element["version"]["name"]}
  
  return "#{pokemon.capitalize} appeared in these in: #{versions_appeared.join(", ")}"
end

p which_version

# dry up versions appeared...
# map and print version

# poke_list["results"]
# i = 0
# while i < poke_list["results"].length
#   species = poke_list["results"]
#   p species[i]["name"]
#   i += 1
# end