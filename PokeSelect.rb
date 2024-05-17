require "http"

poke_list = (HTTP.get("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0").parse)
# p poke_list["results"][0].keys
# i = 0
# while i < 1025    # poke_list["results"].length
#   p poke_list["results"][i]["name"]
#   i += 1
# end


def dex # Gets order dex from one API
  numerical_poke = (HTTP.get("https://pogoapi.net//api/v1/pokemon_names.json").parse)

  id_name = []
  numerical_poke.each do |key, value|
    id_name << [value["id"], value["name"]]
  end

  return id_name.sort()
end