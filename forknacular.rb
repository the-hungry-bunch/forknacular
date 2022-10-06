require 'sinatra'
require './cli'

get '/' do
  'Was ganz anderes'
end

get '/woanders' do
  'Hallo von woanders'
end

get '/recipe' do
  api_call
end
