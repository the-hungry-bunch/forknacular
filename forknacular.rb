require 'sinatra'
require './cli'


get '/' do
  'Was ganz anderes'
end

get '/woanders' do
  'Hallo von woanders'
end

get '/recipe' do
  input = params["text"]
  api_call(input)
end