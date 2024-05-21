require "httparty"
require "json"



base_url = 'https://pokeapi.co/api/v2'
pokemon_name = "pikachu"

# poke_data = HTTParty.get(
#   base_url + "/pokemon/#{pokemon_name}"
#   )
# parsed_data = JSON.parse(poke_data.body)
# p parsed_data.keys

p "------------------
---------------------"
#get species data
# species_data = HTTParty.get(
#   base_url + "/pokemon-species/#{pokemon_name}/"
#   )
# parsed_data2 = JSON.parse(species_data.body)
  
  p "------------------
  ---------------------"

# HERE WE ARE ACCESSING ENCOUNTER DATA
poke_data = HTTParty.get(
  base_url + "/pokemon/#{pokemon_name}"
  )
parsed_data = JSON.parse(poke_data.body)
encounters = HTTParty.get(
  parsed_data["location_area_encounters"]
)


# GETS LOCATION DATA FROM RED AND BLUE
red_blue_encounters = []
i = 0
while i < encounters.length  # should convert to .select loop
  n = encounters[i]
  i2 = 0
  while i2 < n["version_details"].length
    vd = n["version_details"][i2]
    if ['red', 'blue'].include?(vd['version']['name']) == true
      red_blue_encounters << n
    end
    i2 += 1
  end
  i += 1
end

location_names = red_blue_encounters.map do |encounter| # GPT help
  encounter['location_area']['name'].capitalize
end
# p location_names.join(", ")

p "#{pokemon_name}'s locations in the Red/Blue Kanto region are as follows: #{location_names.join(", ")}. More functionality to come."


#THIS GETS CAPTURE RATE NUMBER (OUT OF 255)
# p parsed_data2["capture_rate"]

# THIS GETS TYPES
# types = parsed_data['types'].map do |t|
#   t['type']['name']
# end
# puts "#{pokemon_name.capitalize}'s types are: #{types.join(', ')}"
