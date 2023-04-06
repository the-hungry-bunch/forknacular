arr = [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]]
puts "TicTacToe Game: Bitte horizontale Koordinate eintragen (1 bis 3)"
row = gets.chomp.to_i 

def free?(arr, row, column)
    arr[row-1][column-1] == nil
end

def playerRound() 
    free = false

    while !free
        while row <= 0 || row > 3 do
            puts "Bitte eine Zahl von 1-3"
            row = gets.chomp.to_i
        end

        puts "TicTacToe Game: Bitte verticale Koordinate eintragen (1 bis 3)"
        column = gets.chomp.to_i -1

        while column <= 0 || column > 3 do
            puts "Bitte eine Zahl von 1-3"
            column = gets.chomp.to_i
        end

        free = free?(arr, row, column)
        puts "Feld schon belegt, bitte neue Eingabe starten" if free == false
    end
end

def computerRound()
    row, column  = arr.flatten.index(nil).divmod


