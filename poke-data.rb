require "http"

pokemon = HTTP.get

p pokemon

{
  "Clear": [
    "Grass",
    "Ground",
    "Fire"
  ],
  "Fog": [
    "Dark",
    "Ghost"
  ],
  "Overcast": [
    "Fairy",
    "Fighting",
    "Poison"
  ],
  "Partly Cloudy": [
    "Normal",
    "Rock"
  ],
  "Rainy": [
    "Water",
    "Electric",
    "Bug"
  ],
  "Snow": [
    "Ice",
    "Steel"
  ],
  "Windy": [
    "Dragon",
    "Flying",
    "Psychic"
  ]
}