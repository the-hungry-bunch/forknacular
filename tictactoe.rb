arr = [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]]

def field(arr)
    puts '______'
    arr.each do |row|
        string = ''
        row.each do |element|
            if element == nil
                string = string + ' '
            else
                string = string + element
            end   
            string = string + '|'  
        end
        puts string
        puts '______'
    end
end

def free?(arr, row, column)
    arr[row-1][column-1] == nil
end

def playerRound(arr) 
    free = true
    row = -1
    column = -1
    while free
        while row <= 0 || row > 3 do
            puts "TicTacToe Game: Bitte horizontale Koordinate eintragen (1 bis 3)"
            row = gets.chomp.to_i
        end

        puts "TicTacToe Game: Bitte verticale Koordinate eintragen (1 bis 3)"
        column = gets.chomp.to_i

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

def computerRound(arr)
    row, column  = arr.flatten.index(nil).divmod(3)
    arr[row][column] = 'X'
end

def check_winner(arr)
    gameover = false
    arr.each do |row|
        if row.all? { |cell| cell == 'X'} || row.all? { |cell| cell == 'O'}
            gameover = true
        end 
    end

    arr.transpose.each do |column|
        if column.all? { |cell| cell == 'X'} || column.all? { |cell| cell == 'O'}
            gameover = true
        end 
    end
    
    #diagonals check
    if (arr[0][0] == arr[1][1] && arr[1][1] == arr[2][2]) || 
       (arr[0][2] == arr[1][1] && arr[1][1] == arr[2][0])
       gameover = true
    end

    gameover
end


while true
    field(arr)
    playerRound(arr)
    field(arr)
    if check_winner(arr)
        puts "Yay! Du (Player) hast gewonnen!"
        break
    end
    computerRound(arr)
    if check_winner(arr)
        field(arr)
        puts "Yay! Du (PC) hast gewonnen!"
        break
    end
end




