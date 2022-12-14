require 'rspec'
require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/placement'

describe Game do
  it 'is an instance of a Game' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end
end