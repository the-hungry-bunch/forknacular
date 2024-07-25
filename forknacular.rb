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
  output = params['field'] || [['X',nil,nil],[nil,nil,nil],[nil,nil,nil]]
  erb :tictactoe, locals: {field: output}
end

post '/tictactoe' do
  before = {}
  turn_row = nil
  turn_column = nil

  params.each_key do |key|
    if key.start_with?('before_')
      before[key] = params[key]
      next
    end

    if key.start_with?('turn_')
      key = key.delete_prefix('turn_')
      turn_row = key[0].to_i
      turn_column = key[1].to_i
    end
  end

  before_arr = [[],[],[]]

  before.each do |key, value|
    key = key.delete_prefix("before_") 
    row = key[0].to_i
    column = key[1].to_i
    before_arr[row][column] = value == "" ? nil : value
  end

  #require 'pry'; binding.pry
  if !TicTacToe.valid?(before_arr, turn_row, turn_column)
    return erb(:tictactoe, locals: {field: before_arr})
  end

  after_arr = before_arr
  after_arr[turn_row][turn_column] = 'O'

  #Changed ternary to conditional. Don't know if it's working...
  ttt = TicTacToe.new

  if ttt.check_winner(after_arr)
    return "🥳"
  end

  return "Gleichstand" if !after_arr.flatten.include?(nil)

  ttt.computerRound(after_arr)
  if ttt.check_winner(after_arr)
    return "😭"
  end

  return "Gleichstand" if !after_arr.flatten.include?(nil)

  erb(:tictactoe, locals: {field: after_arr})

  #TicTacToe.valid?(before,after) ? erb(:tictactoe, locals: {field: after_arr}) : erb(:tictactoe, locals: {field: before_arr})
 
end


