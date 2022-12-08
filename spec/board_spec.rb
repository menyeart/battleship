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

end