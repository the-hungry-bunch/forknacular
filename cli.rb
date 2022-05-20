require 'net/http'
require 'uri'
require 'yaml'
require 'json'

api_key = YAML.load_file('config').fetch('spoonacular_apikey', nil)

recipe = {"title": "Spaghetti Carbonara",
          "servings": 2,
          "ingredients": [
            "1 lb spaghetti",
            "3.5 oz pancetta",
            "2 Tbsps olive oil",
            "1  egg",
            "0.5 cup parmesan cheese"
          ],
          "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "
          }
puts api_key
content = Net::HTTP.post(URI("https://api.spoonacular.com/recipes/analyze?apiKey=#{api_key}"), recipe.to_json, "Content-Type" => "application/json")
puts(content)
puts(content.body)
