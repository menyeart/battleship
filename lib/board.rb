class Board
  attr_reader :cells

  def initialize
    @cells = cells
  end

  def cells
    @cells ||= { 
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coord)
    cells.keys.include?(coord)
  end

  def valid_placement?(ship, coordinates)
   
    ship_array = cells.map do |key, value|
      if value.ship != nil
        key
      end
    end

    if ship.length == coordinates.length && ship_array.intersection(coordinates).length == 0
      if coordinates.each_cons(2).to_a.all? {|a, b|  b[1].to_i == a[1].to_i + 1 } && coordinates.each_cons(2).to_a.all? {|a, b| a[0] == b[0]}
        return true
      elsif coordinates.each_cons(2).to_a.all? {|a, b|  a[0].ord + 1 == b[0].ord } && coordinates.each_cons(2).to_a.all? {|a, b| a[1] == b[1]}
        return true
      else
        false
      end
    else
      false
    end
  end

  def place(boat, coordinates)
    cells.each do |key, value|
      if coordinates.any? do |coordinate|
        if coordinate == key
          value.place_ship(boat)
        end
        end
      end
    end
  end

  def render(bool = nil)
    board_array = []

    cells.each do |key, value|
      board_array << value.render(bool)
    end


    spaced_string = board_array.join('').gsub(/(.{1})/, '\1 ')  

    string1 = spaced_string.slice!(0, 8)
    string2 = spaced_string.slice!(0, 8)
    string3 = spaced_string.slice!(0, 8)
    string4 = spaced_string.slice!(0, 8)

    return "  1 2 3 4 \n" + "A #{string1}\n" + "B #{string2}\n" + "C #{string3}\n" + "D #{string4}\n"

    
    
  end  





end  






 



