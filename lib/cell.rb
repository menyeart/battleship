class Cell
    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
        if @ship == nil
            true
        else
            false
        end
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        @fired_upon
    end

    def fire_upon
        @fired_upon = true
        if @ship != nil
            ship.hit
        end
    end

    def render(home = nil)
        if home == true
            @ship == nil ? '.' : 'S'
        elsif @fired_upon == false
            "."
        elsif @fired_upon == true && @ship == nil
            "M"
        elsif @fired_upon == true && ship.health <= 0
            "X"
        else @fired_upon == true && @ship == ship
            "H"
        end
    end
end