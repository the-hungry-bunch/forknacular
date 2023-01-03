require 'sinatra'
require './cli'

get '/warning' do
  output = foodwarning(params['amount'])
  erb :index, :locals => {:warningTextFromAPI => output}
end
