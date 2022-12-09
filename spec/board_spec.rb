require 'Rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Board do
  it "exist" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "contains cells" do
    board = Board.new
    expect(board.cells.class).to eq(Hash)
  end  

  it "contains 16 cells" do
    board = Board.new
    expect(board.cells.keys.length).to eq(16)
  end

  it "has keys that point to cell objects" do
    board = Board.new
    expect(board.cells.values.first).to be_an_instance_of(Cell)
  end

  it "can validate cell keys on the board" do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("E1")).to eq(false)
  end

  it "can validate that the number of coordinates are equal to ship length" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)  
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
  end

  it "can validate if ship placement coordinates are consecutive" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)  
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  end

  it "can validate that coordinates are not placed diagonally" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it "can validate that ship placement is valid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq (true)
  end

  it "can place ship on required cells" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_1.ship).to be_an_instance_of(Ship)
    expect(cell_2.ship).to be_an_instance_of(Ship)
    expect(cell_3.ship).to be_an_instance_of(Ship)
    expect(cell_3.ship).to eq(cell_2.ship)
  end
end

# board.cells_hash["A1"]
# expect(board.cells_hash["A1"]). to eq