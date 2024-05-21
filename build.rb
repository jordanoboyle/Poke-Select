
require "httparty"
require "TTY-prompt"
require "json"

def choose_pokemon
  def fetch_pokemon
    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=151/")
    poke_data = JSON.parse(response.body)
    name_array = []
    poke_data["results"].each do |data|
      name_array.append(data["name"])
    end
    return name_array
  end

  def random_ten
    random_ten = []
    while random_ten.length < 10
      rand_num = rand(0...151)
      if random_ten.include?(rand_num) == true
        next
      else
        random_ten.append(rand_num)
      end
    end
    return random_ten
  end
  
  def poke_selector(rand_ten, poke_array)
    selector = []
    rand_ten.each do |n|
      selector.append(poke_array[n])
    end
    
    prompt = TTY::Prompt.new
    user_poke_choice = prompt.enum_select("Which pokemon of these ten would you like to know more about?", selector)
    return user_poke_choice
  end
  return p poke_selector(random_ten(), fetch_pokemon())
end


class PokeAPI 
  include HTTParty # this line includes all methods from HTTParty in this class

  base_url = "https://pokeapi.co/api/v2/"

  def get_pokemon_data(poke_name)
    response = self.class.get("/pokemon/#{poke_name}")
    poke_data = JSON.parse(response.body)
    return poke_data
  end

  def get_species_data(species_url)
    response = self.class.get(species_url)
    species_data = JSON.parse(response.body)
    return species_data
  end

  def get_encounter_data(encounter_url)
    response = self.class.get(encounter_url)
    JSON.pars(response.body)
  end
end

def poke_data_show(pokemon_name)
  # api = PokeAPI.new
  # pokemon_data = api.get_pokemon_data(pokemon_name)
  
  #BELOW IS NOT SUPPOSED TO BE HERE
  base_url = 'https://pokeapi.co/api/v2'
  pokemon_data = HTTParty.get(
  base_url + "/pokemon/#{pokemon_name}"
  )
  parsed_data = JSON.parse(pokemon_data.body)
  encounters = HTTParty.get(
  parsed_data["location_area_encounters"]
  )

  # DISPLAY ENCOUNTER DATA
  # encounter_url = pokemon_data["location_area_encounters"]
  # encounters = api.get_encounter_data(encounter_url)
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
  if location_names.empty? == true
    p "#{pokemon_name} is a species that cannot be caught in the wild in Red/Blue Kanto region. More functionality to come."
  else
    p "#{pokemon_name.capitalize}'s locations in the Red/Blue Kanto region are as follows: #{location_names.join(", ")}. More functionality to come."
  end
end

poke_data_show(choose_pokemon())


















#goal: fetch a random selection of pokemon from kanto and create a selector with "'pokemon name', I choose you!"
#create a random number generator for numbers 0-10
# create array with no repeats of numbers
# expand this to make sure it can handle 151 pokemon, selection of 10 with no repeats.

# use this array to provide a selector with TTY-prompt
# when selected respond with response above!

# make a method that allows the user to select from four different subjects they want to know about the pokemon they chose.
#display that information and allow them to choose again if they like. 
