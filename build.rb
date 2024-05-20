
require "http"
require "TTY-prompt"

def fetch_pokemon
  poke_data = HTTP.get("https://pokeapi.co/api/v2/pokemon?limit=151/").parse
  name_array = []
  poke_data["results"].each do |data|
    name_array.append(data["name"])
  end
  return name_array
end

# p fetch_pokemon

#goal: fetch a random selection of pokemon from kanto and create a selector with "'pokemon name', I choose you!"
#create a random number generator for numbers 0-10
# create array with no repeats of numbers
# expand this to make sure it can handle 151 pokemon, selection of 10 with no repeats.

# use this array to provide a selector with TTY-prompt
# when selected respond with response above!
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
  # a = [] 
  # selector.each_index do |index| 
  #   a.append({(index + 1) => "#{selector[index]}"})
  # end
  prompt = TTY::Prompt.new
  user_poke_choice = prompt.enum_select("Which pokemon of these ten would you like to know more about?", selector)
  return "I choose you #{user_poke_choice}!!"
end
p poke_selector(random_ten(), fetch_pokemon())


