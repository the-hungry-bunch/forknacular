class TicTacToe

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
        row, column = -1, -1
        while free
            while row <= 0 || row > 3 do
                puts "TicTacToe Game: Bitte horizontale Koordinate eintragen (1 bis 3)"
                row = gets.chomp.to_i
            end

            while column <= 0 || column > 3 do
                puts "TicTacToe Game: Bitte verticale Koordinate eintragen (1 bis 3)"
                column = gets.chomp.to_i
            end

            free = free?(arr, row, column)
            if free == false
                puts "Feld schon belegt, bitte neue Eingabe starten"
                free = true
                row, column = -1, -1
            else
                arr[row-1][column-1] = 'O'
                free = false
            end
        end
        puts arr
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
        if (arr[0][0] == arr[1][1] && arr[1][1] == arr[2][2] && arr[0][0] != nil) || 
        (arr[0][2] == arr[1][1] && arr[1][1] == arr[2][0] && arr[0][2] != nil)
        gameover = true
        end

        gameover
    end

    def play
        field = [[nil, nil, nil], [nil ,nil ,nil ], [nil, nil, nil]]
        while true
            field(field)
            playerRound(field)
            field(field)
            if check_winner(field)
                puts "Yay! Du (Player) hast gewonnen!"
                break
            end
            computerRound(field)
            if check_winner(field)
                field(field)
                puts "Nooo! PC hat gewonnen!"
                break
            end
        end
    end

    def self.valid?(before, after)
        change = []
        before.zip(after) do |cellB, cellA| 
            if cellA != cellB 
                change << cellA
            end
        end
        change.length == 1
            # "Falscher Spielzug! Zu viele Züge"
            # "Kein Spielzug gemacht. Bitte Spielzug einreichen und das Formular abschicken mit Stempel und Unterschrift!"
    end

end
