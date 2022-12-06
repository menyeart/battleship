require 'rspec'
require './lib/ship'

describe Ship do
  it "exists" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_an_instance_of(Ship)
  end

  it "has a name" do
     cruiser = Ship.new("Cruiser", 3)
     expect(cruiser.name).to eql("Cruiser")
  end

  it "has a length" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length). to eql(3)
  end

  it "starts with health equal to it's length" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health). to eql(3)
  end

  it "is not sunk by default" do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.sunk?).to eql(false)
  end

  it "will lose health when it's hit" do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health). to eql(2) 
  end

  it "will lose health every time it's hit" do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.health). to eql(0) 
  end


end




