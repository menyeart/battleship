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
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts @player_board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        player_input_cruiser = gets.chomp.upcase.split
        if player_input_cruiser.all? do |player_coord|
            @player_board.valid_coordinate?(player_coord) == true
        end
                if @player_board.valid_placement?(@player_cruiser, player_input_cruiser) == true
                    @player_board.place(@player_cruiser, player_input_cruiser)
                    puts @player_board.render(true)
                    puts "Enter the squares for the Submarine (2 spaces):"
                end
            else
            invalid_cruiser_placement
        end
            # if board.valid_coordinate?(player_input_cruiser) == true && player_input_cruiser.valid_placement? == true
            #     place("Cruiser", player_input_cruiser)
            # else
            #     puts "Invalid Cruiser placement."
            #     player_ship_placement
            # end

        # puts @player_board.render
        # puts "Enter the squares for the Submarine (2 spaces):"
        
# require 'pry'; binding.pry
    end

    def invalid_cruiser_placement
        
    end

end



