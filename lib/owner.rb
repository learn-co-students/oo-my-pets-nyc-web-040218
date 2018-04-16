class Owner
  attr_reader :species
  attr_accessor :owner_count, :all, :fish, :cat, :dog, :pets, :name

  @@all = []
  @@owner_count = 0

  def initialize(species, name=nil)
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
    @@owner_count += 1
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@owner_count = 0
  end

  def self.count
    @@owner_count
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

def sell_pets
  pets.each do |species, animals|
    animals.each do |animal|
      animal.mood = "nervous"
    end
    animals.clear
  end
end

def list_pets
  "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
end

end