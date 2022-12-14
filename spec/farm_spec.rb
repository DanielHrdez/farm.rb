# frozen_string_literal: true

RSpec.describe Farm do
  it "Farm has a version number" do
    expect(Farm::VERSION).not_to be nil
  end

  describe "Representation of a Animal - Farm::Animal" do
    before :all do
      @vaca = Farm::Animal.new(1, 10234, :Hembra, 20000.0)
    end

    context "Atributes of the class Animal" do
      it "Has a class to represent animals" do
        expect(@vaca).not_to be nil
      end

      it "Has a attribute to identify the animal" do
        expect(@vaca.id).to eq(1)
      end

      it "Has a attribute with the age of the animal in days" do
        expect(@vaca.age).to eq(10234)
      end

      it "Has a attribute with the sex of the animal" do
        expect(@vaca.gender).to eq(:Hembra)
      end

      it "Has a attribute with the weight of the animal in grams" do
        expect(@vaca.weight).to eq(20000.0)
      end

      it "A string is obtained with the information of the animal correctly formatted" do
        expect(@vaca.to_s).not_to eq("")
      end

      it "A number is obtained with the information of the number of animals in the farm" do
        expect(Farm::Animal.count).not_to eq(0)
      end

      before :all do
        @toro = Farm::Animal.new(2, 5235, :Macho, 10219.0)
      end

      it "The animals of the farm can be compared by weight with <=>" do
        expect(@vaca <=> @toro).to eq(1)
      end

      it "The animals of the farm can be compared by weight with <" do
        expect(@vaca < @toro).to eq(false)
      end

      it "The animals of the farm can be compared by weight with >" do
        expect(@vaca > @toro).to eq(true)
      end

      it "The animals of the farm can be compared by weight with ==" do
        expect(@vaca == @toro).to eq(false)
      end

      it "The animals of the farm can be compared by weight with between" do
        @pajaro = Farm::Animal.new(3, 12312, :Macho, 123.3)
        expect(@vaca.between?(@toro, @pajaro)).to eq(false)
      end
    end

    context "Inheritance of the class Animal" do
      it "An instance of the Animal class is expected to be an Animal" do
        expect(@vaca).to be_a(Farm::Animal)
      end

      it "An instance of the Animal class is expected to be an Object" do
        expect(@vaca).to be_a(Object)
      end

      it "An instance of the Animal class is expected to be an BasicObject" do
        expect(@vaca).to be_a(BasicObject)
      end

      it "An instance of the Animal class is not expected to be a String" do
        expect(@vaca).not_to be_a(String)
      end

      it "An instance of the Animal class is not expected to be a Number" do
        expect(@vaca).not_to be_a(Numeric)
      end
    end
  end

  describe "Representation of a Head of Livestock - Farm::Livestock" do
    before :all do
      @pork = Farm::Livestock.new(4, 1245, :Hembra, 456.76, :Porcine, :Meat, :Omnivore)
    end

    context "Atributes of the class Livestock" do
      it "Has a class to represent livestock" do
        expect(@pork).not_to be nil
      end

      it "Has a attribute for the breed (bovine, porcine, ovine, goat)" do
        expect(@pork.breed).to eq(:Porcine)
      end

      it "Has a attribute for the type of exploitation (meat, skin, milk)" do
        expect(@pork.exploit).to eq(:Meat)
      end

      it "Has a attribute for the type of feeding (herbivorous, omnivore)" do
        expect(@pork.feed).not_to eq(:Herbivorous)
      end

      it "A string is obtained with the information of the livestock correctly formatted" do
        expect(@pork.to_s).not_to eq("")
      end

      it "A number is obtained with the information of the number of livestock in the farm" do
        expect(Farm::Livestock.count).not_to eq(0)
      end

      before :all do
        @dog = Farm::Livestock.new(5, 134678, :Hembra, 9876.54, :Bovine, :Meat, :Omnivore)
      end

      it "The livestock of the farm can be compared by weight with <=>" do
        expect(@pork <=> @dog).to eq(-1)
      end

      it "The livestock of the farm can be compared by weight with <" do
        expect(@pork < @dog).to eq(true)
      end

      it "The livestock of the farm can be compared by weight with >" do
        expect(@pork > @dog).to eq(false)
      end

      it "The livestock of the farm can be compared by weight with ==" do
        expect(@pork == @dog).to eq(false)
      end

      it "The livestock of the farm can be compared by weight with between" do
        @cat = Farm::Livestock.new(6, 65467, :Macho, 543435.67, :Bovine, :Meat, :Omnivore)
        expect(@pork.between?(@dog, @cat)).to eq(false)
      end

      it "The livestock of the farm can be summed with +" do
        expect(@pork + 5).not_to eq(@pork)
      end

      it "The livestock of the farm can be subtracted with -" do
        expect(@pork - 5).not_to eq(@pork)
      end

      it "The livestock of the farm can be multiplied with *" do
        expect(@pork * 5).not_to eq(@pork)
      end

      it "The livestock of the farm can be divided with /" do
        expect(@pork / 5).not_to eq(@pork)
      end
    end

    context "Inheritance of the class Livestock" do
      it "An instance of the Livestock class is expected to be an Livestock" do
        expect(@pork).to be_a(Farm::Livestock)
      end

      it "An instance of the Livestock class is expected to be an Animal" do
        expect(@pork).to be_a(Farm::Animal)
      end

      it "An instance of the Livestock class is expected to be an Object" do
        expect(@pork).to be_a(Object)
      end

      it "An instance of the Livestock class is expected to be an BasicObject" do
        expect(@pork).to be_a(BasicObject)
      end

      it "An instance of the Livestock class is not expected to be a String" do
        expect(@pork).not_to be_a(String)
      end

      it "An instance of the Livestock class is not expected to be a Number" do
        expect(@pork).not_to be_a(Numeric)
      end
    end
  end

  describe "Representation of the Data of a Farm - Farm::Data" do
    before :all do
      @data = Farm::Data.new(1, "La Granja de Juan", "Ganadera", "La Granja de Juan es Ganadera")
    end

    context "Atributes of the class Data" do
      it "Has an attribute to identify the farm" do
        expect(@data.id).to eq(1)
      end

      it "Has an attribute for the name of the farm" do
        expect(@data.name).to eq("La Granja de Juan")
      end

      it "Has an attribute for the type of the farm (poultry, livestock)" do
        expect(@data.type_farm).to eq("Ganadera")
      end

      it "Has an attribute for the description of the farm" do
        expect(@data.description).to eq("La Granja de Juan es Ganadera")
      end

      it "A string is obtained with the information of the farm correctly formatted" do
        expect(@data.to_s).to eq("ID: 1\nName: La Granja de Juan\nType Farm: Ganadera\nDescription: La Granja de Juan es Ganadera")
      end
    end

    context "Inheritance of the class Data" do
      it "An instance of the Data class is expected to be an Data" do
        expect(@data).to be_a(Farm::Data)
      end

      it "An instance of the Data class is expected to be an Object" do
        expect(@data).to be_a(Object)
      end

      it "An instance of the Data class is expected to be an BasicObject" do
        expect(@data).to be_a(BasicObject)
      end

      it "An instance of the Data class is not expected to be a String" do
        expect(@data).not_to be_a(String)
      end

      it "An instance of the Data class is not expected to be a Number" do
        expect(@data).not_to be_a(Numeric)
      end
    end
  end

  describe "Interface of the functionalities - Farm::Function" do
    context 'Components of the module Function' do
      it "Exist a module to store the functionalities" do
        expect(Farm::Function).not_to be nil
      end

      it "Exist a constant to represent the life conditions (open field, barn)" do
        expect(Farm::Function::FIELD).not_to be nil
        expect(Farm::Function::CAGES).not_to be nil
      end

      it "Exist a process to manage the animals" do
        expect(Farm::Function.manage(:field, 5  )).to eq :sheds
        expect(Farm::Function.manage(:field, 12 )).to eq :free
        expect(Farm::Function.manage(:cages, 16 )).to eq :auto
      end

      before :all do
        @cabra = Farm::Animal.new(1, 500, :Hembra, 3200.5)
        @oveja = Farm::Animal.new(2, 770, :Macho, 4500.67)
        @murcielago = Farm::Animal.new(3, 9012, :Hembra, 181)
        @cattle = Farm::Cattle.new(
          4, "La Granja de Juan", "La Granja de Juan es Ganadera",
          :Ganadera, :Meat, 10.0, 2.0, [@cabra, @oveja, @murcielago]
        )
        @cattle2 = Farm::Cattle.new(
          5, "La Granja de Juan", "La Granja de Juan es Ganadera",
          :Ganadera, :Sacrifice, 30.0, 0.1, [@cabra, @oveja]
        )
        @cattle3 = Farm::Cattle.new(
          6, "La Granja de Juan", "La Granja de Juan es Ganadera",
          :Ganadera, :Meat, 10.0, 2.0, [@oveja, @murcielago]
        )
      end

      it "Exist a process to give antibiotics to the animals" do
        expect(Farm::Function.antibiotics(0.01, @cattle)).to eq [0.01, 0.01, 0.01]
      end

      it "Exist a process to get the animals that can reproduce" do
        expect(Farm::Function.repro(24, @cattle)).to eq [@oveja, @murcielago]
      end

      it "Exist a process to get the welfare of a farm" do
        expect(Farm::Function.welfare(@cattle, :field)).to eq(63.77142099685452)
        expect(Farm::Function.welfare(@cattle, :cages)).to eq(31.88571049842726)
      end

      it "Exist a process to get the net profit of a farm" do
        expect(Farm::Function.net_profit(@cattle)).to eq(76.05415002219263)
        expect(Farm::Function.net_profit(@cattle2)).to eq(8.555581724498799)
      end

      it "Exist a process to get the productivity index of a farm" do
        expect(Farm::Function.productivity(@cattle, :field)).to eq(2)
        expect(Farm::Function.productivity(@cattle2, :cages)).to eq(1)
      end

      it "Getting the max productivity index of an Array of farms" do
        expect([@cattle, @cattle2].collect { |farm| Farm::Function.productivity(farm, :field) }.max).to eq(2)
        expect([@cattle3, @cattle].collect { |farm| Farm::Function.productivity(farm, :cages) }.max).to eq(2)
      end

      it "Increasing the sale price of the farms" do
        cooperative = [@cattle, @cattle2, @cattle3]

        max_productivity = cooperative.collect { |farm| Farm::Function.productivity(farm, :cages) }.max
        list_max_farm = cooperative.select { |farm| Farm::Function.productivity(farm, :cages) == max_productivity }
        max_sale = list_max_farm.collect { |farm| farm.sale_price }.max
        
        expect(cooperative.collect { |farm| farm.sale_price != max_sale ? farm.sale_price += max_sale / farm.sale_price : farm.sale_price }).to eq([2.0, 20.1, 2.0])
      end
    end

    context "Inheritance of the module Function" do
      it "Is expected to be a Module" do
        expect(Farm::Function).to be_a(Module)
      end

      it "Is expected to be an Object" do
        expect(Farm::Function).to be_a(Object)
      end

      it "Is expected to be an BasicObject" do
        expect(Farm::Function).to be_a(BasicObject)
      end

      it "Is not expected to be a String" do
        expect(Farm::Function).not_to be_a(String)
      end

      it "Is not expected to be a Number" do
        expect(Farm::Function).not_to be_a(Numeric)
      end
    end
  end

  describe "Representation of the Farm - Farm::Cattle" do
    before :all do
      @vaca = Farm::Animal.new(3, 12312, :Macho, 123.3)
      @cabra = Farm::Animal.new(4, 12398, :Hembra, 323.3)
      @cattle = Farm::Cattle.new(
        1234,     "La Granja de Juan",  "La Granja de Juan es Ganadera",
        :Bovine,  :Milk, 
        0.0,      0.0,                  [@vaca, @cabra],
      )
    end

    context "Inheritance of the class Cattle" do
      it "An instance of the Cattle class is expected to be an Cattle" do
        expect(@cattle).to be_a(Farm::Cattle)
      end

      it "An instance of the Cattle class is expected to be Data" do
        expect(@cattle).to be_a(Farm::Data)
      end

      it "An instance of the Cattle class is expected to be an Object" do
        expect(@cattle).to be_a(Object)
      end

      it "An instance of the Cattle class is expected to be an BasicObject" do
        expect(@cattle).to be_a(BasicObject)
      end

      it "An instance of the Cattle class is not expected to be an Animal" do
        expect(@cattle).not_to be_a(Farm::Animal)
      end

      it "An instance of the Cattle class is not expected to be a livestock" do
        expect(@cattle).not_to be_a(Farm::Livestock)
      end
    end

    context "Atributes of the class Cattle" do
      it "Has a class to store the data of the farm" do 
        expect(@cattle).not_to be nil
      end

      it "Has an attribute for the type of livestock(Bovine, Ovine, Caprine or Porcine)" do
        expect(@cattle.type_cattle).to eq(:Bovine)
      end

      it "Has an attribute for the destiny of the animals(Milk, Sacrifice)" do
        expect(@cattle.destiny).to eq(:Milk)
      end

      it "Has an attribute for the number of animals" do
        expect(@cattle.number).to eq(2)
      end

      it "Has an attribute for the unitary price of the animals" do
        expect(@cattle.price).to eq(0)
      end

      it "Has an attribute for the unitary sale price of the animals" do
        expect(@cattle.sale_price).to eq(0)
      end

      it "Has an attribute to store the animals" do
        expect(@cattle.animals).not_to be nil
      end

      it "A string is obtained with the information of the farm correctly formatted" do
        expect(@cattle.to_s).to eq(
          "ID: 1234\n" + 
          "Name: La Granja de Juan\nType Farm: Cattle\n" + 
          "Description: La Granja de Juan es Ganadera\n" + 
          "Type Cattle: Bovine\nDestiny: Milk\nNumber: 2\nPrice: 0.0\n" + 
          "Sale Price: 0.0\n" + "Animals:\nID: 3\nAge: 12312\n" + 
          "Gender: Macho\nWeight: 123.3\n" +
          "ID: 4\nAge: 12398\nGender: Hembra\nWeight: 323.3\n"
        )
      end

      it "Has an each method to iterate over the animals" do
        expect(@cattle.each { |attr| attr }).to eq [@vaca, @cabra]
      end

      it "Has a max method to get the maximum weight of the animals" do
        expect(@cattle.max {}).to eq @cabra
      end

      it "Has a min method to get the minimum weight of the animals" do
        expect(@cattle.min {}).to eq @vaca
      end

      it "Has a sort method to sort the animals by weight" do
        expect(@cattle.sort {}).to eq [@vaca, @cabra]
      end

      it "Has a collect method to iterate over the animals and return a new array" do
        expect(@cattle.collect { |animal| animal.age    > 12352 }).to eq [  false,   true]
        expect(@cattle.collect { |animal| animal.age    + 1     }).to eq [  12313,  12399]
        expect(@cattle.collect { |animal| animal.weight - 1000  }).to eq [ -876.7, -676.7]
      end

      it "Has a select method to iterate over the animals and return a new array" do
        expect(@cattle.select { |animal| animal.weight  > 300   }).to eq [@cabra]
        expect(@cattle.select { |animal| animal.age     < 12352 }).to eq [@vaca]
        expect(@cattle.select { |animal| animal.id      == 3    }).to eq [@vaca]
      end

      it "Has a count method to count the animals" do
        expect(@cattle.count { |animal| animal              }).to eq 2
        expect(@cattle.count { |animal| animal.weight > 300 }).to eq 1
      end

      it "Has a reject method to iterate over the animals and return a new array" do
        expect(@cattle.reject { |animal| animal.weight > 300    }).to eq [@vaca ]
        expect(@cattle.reject { |animal| animal.age    < 12352  }).to eq [@cabra]
        expect(@cattle.reject { |animal| animal.id     == 3     }).to eq [@cabra]
      end

      it "Has a map method to iterate over the animals and return a new array" do
        expect(@cattle.map { |animal| animal.age    + 1     }).to eq [  12313,  12399]
        expect(@cattle.map { |animal| animal.weight - 1000  }).to eq [ -876.7, -676.7]
      end

      it "Has a find method to iterate over the animals and return the first one that satisfies the condition" do
        expect(@cattle.find { |animal| animal.weight > 300    }).to eq @cabra
        expect(@cattle.find { |animal| animal.age    < 12352  }).to eq @vaca
        expect(@cattle.find { |animal| animal.id     == 3     }).to eq @vaca
      end

      it "Has a any? method to iterate over the animals and return true if at least one animal satisfies the condition" do
        expect(@cattle.any? { |animal| animal.weight > 300    }).to eq true
        expect(@cattle.any? { |animal| animal.age    < 12352  }).to eq true
        expect(@cattle.any? { |animal| animal.id     == 3     }).to eq true
      end
    end
  end
end