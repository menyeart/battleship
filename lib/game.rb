class Game

    def initialize
        @placement = Placement.new
        @computer_board = Board.new
        @player_board = Board.new
        @comp_cruiser = Ship.new("Cruiser", 3)
        @comp_sub = Ship.new("Submarine", 2)
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_sub = Ship.new("Submarine", 2)

    end

    def start
        puts "
                     __/___     |>       
                    /_____/_____|_           
            _______/_____/_______|_____    
            \\   USS  < < <  TURING   || 
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
        "
        puts "       -*-*-*- Welcome to Battleship -*-*-*-       "
        puts "\nEnter p to play. Enter q to quit"

        user_choice = gets.chomp.downcase
        if user_choice == "p"
            comp_ships = [@comp_sub, @comp_cruiser]
            comp_ships.each do |boat|
                comp_coord_selection(boat)
            end
            player_ship_placement
        elsif user_choice == "q"
            exit
        else
            puts "Invalid input"
            start
        end
    end

    def comp_coord_selection(boat)
        if boat.name == "Submarine"
           comp_coords = @placement.sub_placements.sample(1).flatten
           @computer_board.valid_placement?(boat, comp_coords) == true ? @computer_board.place(boat, comp_coords) : comp_coord_selection(boat)
        else
            comp_coords = @placement.cruiser_placements.sample(1).flatten
            @computer_board.valid_placement?(boat, comp_coords) == true ? @computer_board.place(boat, comp_coords) : comp_coord_selection(boat)
        end
    end

    def player_ship_placement
        puts "I have laid out my ships on the grid.\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n\n"
        puts @player_board.render
        player_cruiser_placement
        player_sub_placement
        turn
    end

    def player_cruiser_placement
        puts "\nEnter the squares for the Cruiser (3 spaces, ex. <A1 A2 A3> ):"
        player_input_cruiser = gets.chomp.upcase.split
        if player_input_cruiser.all? do |player_coord|
            @player_board.valid_coordinate?(player_coord) == true
        end
                if @player_board.valid_placement?(@player_cruiser, player_input_cruiser) == true
                    @player_board.place(@player_cruiser, player_input_cruiser)
                    puts "Your Cruiser has been placed on the board:\n\n"
                    puts @player_board.render(true)
                else
                    puts "Those are invalid coordinates. Please try again:"
                    player_cruiser_placement
                end
        else
            puts "Those are invalid coordinates. Please try again:"
            player_cruiser_placement
        end
    end

    def player_sub_placement
        puts "Enter the squares for the Submarine (2 spaces, ex. <B1 B2>):"
        player_input_sub = gets.chomp.upcase.split
        if player_input_sub.all? do |player_coord|
            @player_board.valid_coordinate?(player_coord) == true
        end
            if @player_board.valid_placement?(@player_sub, player_input_sub) == true
                @player_board.place(@player_sub, player_input_sub)
                puts "Your Submarine has been placed on the board:\n\n"
                puts @player_board.render(true)
            else
                puts "Those are invalid coordinates. Please try again:"
                player_sub_placement
            end
        else
            puts "Those are invalid coordinates. Please try again:"
            player_sub_placement
        end
    end

    def turn
        puts "\n-------- Prepare for combat! --------\n\n"
        puts "============= COMPUTER BOARD =============\n\n"
        puts @computer_board.render
        puts "\n============== PLAYER BOARD ==============\n\n"
        puts @player_board.render(true)
        puts "\nEnter the coordinate for your shot:"
        player_turn
    end
        
    def player_turn
        player_shot = gets.chomp.upcase
            if @computer_board.cells[(player_shot)].fired_upon? == true
                put "\nThis cell has been fired upon previously, please enter a new coordiate"
                player_turn
            elsif @computer_board.valid_coordinate?(player_shot) == true
                p @computer_board.cells[player_shot].fire_upon
            else
                puts "\nPlease enter a valid coordinate:"
                player_turn
            end
    end




    def comp_shot
        computer_shots = @player_board.cells.keys
        computer_shot = computer_shots.sample(1)[0]
        @player_board.cells[computer_shot].fire_upon
        computer_shots.delete_if {|shot_choice| shot_choice == computer_shot}

    end

    def result_report(board, shot_key)
        if board.cells[shot_key].empty? == true
            puts "The shot on #{shot_key} was a miss"
        else
            
        end

    end
end



