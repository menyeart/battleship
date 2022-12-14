require 'rspec'
require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/placement'

describe Placement do
  it 'placement is an instance of placement' do
    placement = Placement.new
    expect(placement).to be_an_instance_of(Placement)
  end
  
  it 'placements contains valid placements for ships' do
    game = Game.new
    sub = Ship.new("Submarine", 2)
    player_cruiser = Ship.new("Cruiser", 3)
    placement = Placement.new
    expect(placement.sub_placements.first.length).to eq(2)
    expect(placement.cruiser_placements.first.length).to eq(3)
    end
end