class Game

    def initialize
        @placement = Placement.new
        @board = Board.new
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

    def comp_placement
        #create a ship
        # @comp_cruiser
        # @comp_sub
        #create valid coordinates for ship placement
        #place ship on coordinates
    end

    def comp_coord_selection(boat)
        if boat.name == "Submarine"
           comp_coords = @placement.sub_placements.sample(1).flatten
           @board.valid_placement?(boat, comp_coords) == true ? @board.place(boat, comp_coords) : comp_coord_selection(boat)
        else
           comp_coords = @placement.cruiser_placements.sample(1).flatten
           p @board.valid_placement?(boat, comp_coords) == true ? @board.place(boat, comp_coords) : comp_coord_selection(boat)
        end
        puts @board.render(true)
        puts "I have laid out my ships on the grid."
    end

end



