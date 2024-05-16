require "tty-prompt"

# quick overview of %w flag for the uninitiated (ie: ME).
# %w() is a shortcut or shorthand way of creating an array in ruby without the need for commas and quotes. Each word/line-of-characters is converted into a string element in an array. Example below:
fruits = %w(banana apple pear strawberry asldfasdf)
p fruits # see NEAT

prompt = TTY::Prompt.new

choices = %w(Eggmoves EvolutionChain MoveSet LevelEvolve ShinyColor HMLearnables Type Weaknesses Strengths)
user_choice = prompt.multi_select("Select what you would like to know more about?", choices)
p "DefaultName would like to know more about #{user_choice[0]}."

