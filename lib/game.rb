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
        puts "Welcome to Battleship"
        puts "Enter p to play. Enter q to quit"

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
            @placement.sub_placements.sample(1).flatten
        else
            @placement.cruiser_placements.sample(1).flatten
        end

    end

end