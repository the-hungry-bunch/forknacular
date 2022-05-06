require 'net/http'

content = Net::HTTP.get('example.com', '/index.html')
puts(content)
