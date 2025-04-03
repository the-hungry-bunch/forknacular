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
  output = params['field'] || [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]]
  erb :tictactoe, locals: {field: output}
end
