require 'net/http'
require 'json'
require 'uri'

=begin - code not used
# Defining the URL we want to query
# TODO: access the apiKey explicitly
key = File.read("config").split[1]
uri = "https://api.spoonacular.com/recipes/analyze?apiKey="+key

# Building a recipe hash
# TODO: Reduce the recipe to a minimum. Which parts of it do we really need?
# TODO: May we want to enable the user to enter his own recipe?
recipe = {
    title: "Salty Salad",
    servings: 2,
    ingredients: [
        "1 lb salad",
        "3.5 oz salt",
        "2 Tbsps olive oil",
        "1 chicken",
        "0.5 cup vinegar"
    ],
    instructions: "Get a bowl, put all the ingredients in and arrange it nicely."
}

# Querying the API with our URL and recipe hash - converted to JSON
content = Net::HTTP.post(URI(uri), recipe.to_json)

# Parsing the response body (JSON file) and printing some output to the terminal
if JSON.parse(content.body)["vegetarian"] == true
    puts "🥗 Guten Appetit, das darfst du essen! 🥣"
else
    puts "🐥 Finger weg! Töte keine Tiere! 🐷"
end
=end

def api_call(input)
    key = File.read("config").split[1]
    uri = "https://api.spoonacular.com/food/wine/pairing?food="+input+"&apiKey="+key
    content = Net::HTTP.get(URI(uri))
    response = JSON.parse(content)["pairingText"]
end


def foodwarning()
    uri = URI.parse("https://megov.bayern.de/verbraucherschutz/baystmuv-verbraucherinfo/rest/api/warnings/merged")
    header = {'Content-Type': 'application/json'}
    body = {
        food: {
        rows: 10,
        sort: "publishedDate desc, title asc",
        start: 5,
        fq: [
            "publishedDate > 1630067654000"
            ]
            }
        }
    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = body.to_json
    # Send the request
    content = http.request(request)
    require 'pry'; binding.pry
    response = JSON.parse(content)["pairingText"]
end






