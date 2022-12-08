require 'Rspec'
require './lib/board'
require './lib/ship'

describe Board do
  it "exist" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end
end