require 'net/http'
require 'json'
require 'uri'

# Defining the URL we want to query
# TODO: Remove API key from the string. Import it from the config file and use a variable instead (string interpolation).
uri = "https://api.spoonacular.com/recipes/analyze?apikey=5e0356f3b7bd454886811a57765cecf9"

# Building a recipe hash
# TODO: Reduce the recipe to a minimum. Which parts of it do we really need?
# TODO: May we want to enable the user to enter his own recipe?
recipe = {
    title: "Salty Salad",
    "servings": 2,
    "ingredients": [
        "1 lb salad",
        "3.5 oz salt",
        "2 Tbsps olive oil",
        "1 chicken",
        "0.5 cup vinegar"
    ],
    "instructions": "Get a bowl, put all the ingredients in and arrange it nicely."
}

# Querying the API with our URL and recipe hash - converted to JSON
content = Net::HTTP.post(URI(uri), recipe.to_json)

# Parsing the response body (JSON file) and printing some output to the terminal
if JSON.parse(content.body)["vegetarian"] == true
    puts "🥗 Guten Appetit, das darfst du essen! 🥣"
else
    puts "🐥 Finger weg! Töte keine Tiere! 🐷"
end
