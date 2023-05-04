arr = [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]]

def free?(arr, row, column)
    arr[row-1][column-1] == nil
end

def playerRound() 
    free = true

    while free
        while row <= 0 || row > 3 do
            puts "TicTacToe Game: Bitte horizontale Koordinate eintragen (1 bis 3)"
            row = gets.chomp.to_i
        end

        puts "TicTacToe Game: Bitte verticale Koordinate eintragen (1 bis 3)"
        column = gets.chomp.to_i -1

        while column <= 0 || column > 3 do
            puts "Bitte eine Zahl von 1-3"
            column = gets.chomp.to_i
        end

        free = free?(arr, row, column)
        if free == false
            puts "Feld schon belegt, bitte neue Eingabe starten"
        else
            arr[row-1][column-1] = 'O'
            free = false
        end
    end
end

def computerRound()
    row, column  = arr.flatten.index(nil).divmod(3)
    arr[row][column] = 'X'
end

def winner
    gameover? = false
    arr.each do |row|
        if row.all? { |cell| cell == 'X' }
            winner = 'computer'
            gameover = true
        elsif row.all? { |cell| cell == 'O' }
            winner = 'player'
            gameover = true
        end 
    end

    arr.transpose.each do |column|
        if column.all? { |cell| cell == 'X' }
            winner = 'computer'
            gameover = true
        elsif column.all? { |cell| cell == 'O' }
            winner = 'player'
            gameover = true
        end 
    end
    
    #diagonals check
    arr[0][0] == arr[1][1] == arr[2][2] == 'X'
    arr[0][0] == arr[1][1] == arr[2][2] == 'O'
    arr[0][2] == arr[1][1] == arr[2][0] == 'X'
    arr[0][2] == arr[1][1] == arr[2][0] == 'O'

end

while true
    playerRound()
    computerRound()
end


#who wins?
#how does the game field looks like?


