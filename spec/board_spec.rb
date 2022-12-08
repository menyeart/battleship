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








end