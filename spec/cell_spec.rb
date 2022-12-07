require 'rspec'
require './lib/ship'
require './lib/cell'

describe Cell do
    it 'exists' do
        cell = Cell.new("B4")

        expect(cell).to be_an_instance_of(Cell)
    end

    it 'has a coordinate' do
        cell = Cell.new("B4")

        expect(cell.coordinate).to eq("B4")
    end

    it 'doesnt contain a ship by default' do
        cell = Cell.new("B4")

        expect(cell.ship).to eq(nil)
    end

    it 'is empty by default' do
        cell = Cell.new("B4")

        expect(cell.empty?).to eq(true)
    end

    it 'places ship in cell' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)

        expect(cell.ship.name).to eq("Cruiser")
    end

    it 'has not be fired upon be default' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        expect(cell.fired_upon?). to eql(false)
    end

end
