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
  end

  











end