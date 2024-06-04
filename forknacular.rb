require 'sinatra'
require './cli'
require './tictactoe'

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

post '/tictactoe' do
  before = {}
  after = {}
  params.each_key do |key|
    if key.start_with?('before_')
      before[key] = params[key]
    else
      after[key] = params[key]
    end
  end
  #require 'pry';  binding.pry

  before_arr = [[],[],[]]
  after_arr = [[],[],[]]

  before.each do |key, value|
    key = key.delete_prefix("before_") 
    row = key[0].to_i
    column = key[1].to_i
    before_arr[row][column] = value == "" ? nil : value
  end

  after.each do |key, value|
    row = key[0].to_i
    column = key[1].to_i
    after_arr[row][column] = value == "" ? nil : value
  end

  if !TicTacToe.valid?(before,after)
    erb(:tictactoe, locals: {field: before_arr})
  end

  #Changed ternary to conditional. Don't know if it's working...
  ttt = TicTacToe.new

  if ttt.check_winner(after_arr)
    return "🥳"
  end
  ttt.computerRound(after_arr)
  if ttt.check_winner(after_arr)
    return "😭"
  end
  erb(:tictactoe, locals: {field: after_arr})

  #TicTacToe.valid?(before,after) ? erb(:tictactoe, locals: {field: after_arr}) : erb(:tictactoe, locals: {field: before_arr})
 
end


