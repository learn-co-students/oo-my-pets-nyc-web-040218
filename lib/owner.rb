class Owner

  ALL = []

  attr_accessor :pets, :name

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    ALL << self
  end

  def self.all
    ALL
  end

  def self.count
    ALL.length
  end

  def self.reset_all
    ALL.clear
  end

  def species
    @species
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    @pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    i = 0
    until i == @pets[:dogs].length
      @pets[:dogs][i].mood=("happy")
      i += 1
    end   #def walk_dogs
            #@pets[:dogs].map!{|dog| dog.mood = "happy"}
  end


  def play_with_cats
    i = 0
    until i == @pets[:cats].length
      @pets[:cats][i].mood=("happy")
      i += 1
    end
  end

  def feed_fish
    i = 0
    until i == @pets[:fishes].length
      @pets[:fishes][i].mood=("happy")
      i += 1
    end
  end

  def sell_pets
    @pets.each do |type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
      end
      pet_array.clear
    end
    # @pets.each do |type, pets|
  end

    # def sell_pets
    #   @pets.each do |type, pets|
    #     pets.each do |pet|
    #       pet.mood = "nervous"
    #     end
    #   end
    #     puts "BEFORE"
    #     puts pets
    #     puts "---------------"
    #     pets.clear
    #     puts "---------------"
    #     puts "AFTER"
    #     puts pets
    #   end


    # i = 0
    # until i == @pets[:fishes].length
    #   @pets[:fishes][i].mood=("nervous")
    #   i += 1
    # end
    # i = 0
    # until i == @pets[:cats].length
    #   @pets[:cats][i].mood=("nervous")
    #   i += 1
    # end
    # i = 0
    # until i == @pets[:dogs].length
    #   @pets[:dogs][i].mood=("nervous")
    #   i += 1
    # end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
