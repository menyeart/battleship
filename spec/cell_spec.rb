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

    it 'can tell if it has been fired upon' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cell.fire_upon
        expect(cell.fired_upon?). to eql(true)
    end

    it 'can transmit damage to a ship when fired upon' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        cell.fire_upon
        expect(cell.fired_upon?). to eql(true)
        expect(cell.ship.health). to eql(2)
    end

    it 'Cell renders . symbol by default' do
        cell_1 = Cell.new("B4")
        
        expect(cell_1.render).to eq(".")
    end

    it 'Cell renders M when fired upon and contains no ship' do
        cell_1 = Cell.new("B4")
        cell_1.fire_upon

        expect(cell_1.render).to eq("M")
    end

    it 'Cell renders to H when fired upon and contains a ship' do
        cell_1 = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell_1.place_ship(cruiser)
        cell_1.fire_upon

        expect(cell_1.render).to eq("H")
    end

    it 'Cell renders to X when a cell is fired upon and ship is sunk' do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        cell_2.place_ship(cruiser)
        cruiser.hit
        cruiser.hit
        cell_2.fire_upon

        expect(cell_2.render).to eq("X")
    end

    it 'Cell renders S when a cell is not fired upon and contains ship' do
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        cell_2.place_ship(cruiser)

        expect(cell_2.render(true)).to eq("S")
    end
end
