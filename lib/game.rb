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

end



