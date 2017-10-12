require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Harrison") }
    subject(:pie) { Dessert.new("pie", 2, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq('pie')
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(2)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pie", "none", "Harrison") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      pie.add_ingredient("flower")
      expect(pie.ingredients).to eq(["flower"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "flower", "water", "blueberries"]
      ingredients.each do |ingredient|
        pie.add_ingredient(ingredient)
      end

      expect(pie.ingredients).to eq(ingredients)
      pie.mix!
      expect(pie.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pie.eat(1)
      expect(pie.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ pie.eat(10)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Harrison")
      expect(pie.serve).to eq("Harrison has made 2 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
