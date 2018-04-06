class Owner
  attr_reader :species
  attr_accessor :pets, :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |animal|
      animal.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |animal|
      animal.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |k, v|
      v.each do |animal|
        animal.mood = "nervous"
      end
      v.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].size} fish, #{self.pets[:dogs].size} dog(s), and #{self.pets[:cats].size} cat(s)."
  end
end
