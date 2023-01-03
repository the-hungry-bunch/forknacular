require 'net/http'
require 'json'
require 'uri'

def foodwarning(amount)
    uri = URI('https://megov.bayern.de/verbraucherschutz/baystmuv-verbraucherinfo/rest/api/warnings/merged')

    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Post.new uri
        request['Content-Type'] = 'application/json'
        request['Authorization'] = "baystmuv-vi-1.0 os=ios, key=9d9e8972-ff15-4943-8fea-117b5a973c61"
        body = {"food": {"rows": amount, "sort": "publishedDate desc, title asc", "start": 0, "fq": ["publishedDate > 1630067654000"]}}
        request.body = body.to_json
        response = http.request request # Net::HTTPResponse object
        JSON.parse(response.body).dig('response', 'docs').map {|w| w['warning']}
    end
end
