class Game

    def initialize
        @board = Board.new
        @comp_cruiser = Ship.new("Cruiser", 3),
        @comp_sub = Ship.new("Submarine", 2),
        @player_cruiser = Ship.new("Cruiser", 3),
        @player_sub = Ship.new("Submarine", 2)
        @coordinate_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    end

    def start
        puts "Welcome to Battleship"
        puts "Enter p to play. Enter q to quit"

        user_choice = gets.chomp.downcase
        if user_choice == "p"
            comp_ships = [@comp_sub, @comp_cruiser]
            comp_ships.each do |ship|
                comp_coord_selection(ship)
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
        # @coordinate_array = game.board1.cells.keys
        # @coordinate_array = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
        #place ship on coordinates
    end

    def comp_coord_selection(ship)
        loop_variable = nil
        until loop_variable == true
        if ship.length == 2
           p comp_coords = @coordinate_array.sample(2)
        else
            p comp_coords = @coordinate_array.sample(3)
        end
        if @board.valid_placement?(ship, comp_coords) == false
            comp_coord_selection(ship)
        else
            loop_variable = true
        end    
        end
    
        

    end

    # def comp_coord_valid_placement(ship, coords)
    #     board.valid_placement?(ship, coords)

    # end
end