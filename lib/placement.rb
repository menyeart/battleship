class Placement 

  def initialize

  end

  def cruiser_placements
    @cruiser_placements = [
      ["A1", "A2", "A3"],
      ["A2", "A3", "A4"],
      ["B1", "B2", "B3"],
      ["B2", "B3", "B4"],
      ["C1", "C2", "C3"],
      ["C2", "C3", "C4"],
      ["D1", "D2", "D3"],
      ["D2", "D3", "D4"],
      ["A1", "B1", "C1"],
      ["B1", "C1", "D1"],
      ["A2", "B2", "C2"],
      ["B2", "C2", "D2"],
      ["A3", "B3", "C3"],
      ["B3", "C3", "D3"],
      ["A4", "B4", "C4"],
      ["B4", "C4", "D4"]
    ]
    end

  def sub_placements
    @sub_placements = [
      ["A1", "A2"],
      ["B1", "B2"],
      ["C1", "C2"],
      ["D1", "D2"],
      ["A2", "A3"],
      ["B2", "B3"],
      ["C2", "C3"],
      ["D2", "D3"],
      ["A3", "A4"],
      ["B3", "B4"],
      ["C3", "C4"],
      ["D3", "D4"],
      ["A1", "B1"],
      ["A2", "B2"],
      ["A3", "B3"],
      ["A4", "B4"],
      ["B1", "C1"],
      ["B2", "C2"],
      ["B3", "C3"],
      ["B4", "C4"],
      ["C1", "D1"],
      ["C2", "D2"],
      ["C3", "D3"],
      ["C4", "D4"]
    ]
    end
end