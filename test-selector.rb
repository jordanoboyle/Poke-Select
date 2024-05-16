require "tty-prompt"


# let's figure out how to use this!!!!
prompt = TTY::Prompt.new

# prompt.ask("What is you name?", default: ENV["USER"])  # this pulls user from zsh terminal environment

# prompt.yes?("Do you like using ruby?") # this will prompt for yes or no

# prompt.mask("What is your secret?") # This will hide the answer....dive into docs for this.

first_choice = prompt.select("Whos that pokemon?", %w(Squirtle Charmander Bulbasaur))  # provides a selector, choice can be assigned to a user_input variable
p first_choice

# ASK A MULTIPLE CHOICE QUESTION
choices = %w(Pikachu Vaporeon Umbreon Cinderace)
fav_poke = prompt.multi_select("Of these pokemon, which is your favorite?", choices)
p fav_poke  #follow the instructions you dummy. Use "SPACEBAR" assigns to var as array
p fav_poke[0]

#  ASK FOR A SELECTION FROM AN ENUMERATED LIST
asks = ["Red/Blue", "Gold/Silver", "Ruby/Saphire", "Diamond/Pearl"]
prompt.enum_select("Which generation is your favorite?")

