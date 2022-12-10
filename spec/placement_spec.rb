require 'rspec'
require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/placement'

describe Placement do
    it 'placement is an instance of placement' do
        game = Game.new
        sub = Ship.new("Submarine", 2)
        cruise = Ship.new("Cruiser", 3)
        sub_placement = Placement.new
        cruiser_placement = Placement.new
        # require 'pry'; binding.pry
        expect(game.comp_coord_selection(sub).length).to eq(2)
        expect(game.comp_coord_selection(cruise).length).to eq(3)
    end
end