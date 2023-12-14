require 'sinatra'
require './cli'

get '/warning' do
  output = foodwarning(params['amount'])
  erb :index, locals: {warningTextFromAPI: output}
end

get '/' do
  erb :overview
end

get '/tictactoe' do
  output = params['field'] || [["a","b","c"],["1",nil,"3"],[nil,"5",nil]]
  erb :tictactoe, locals: {field: output}
end