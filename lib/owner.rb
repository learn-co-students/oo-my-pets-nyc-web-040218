require "pry"

class Owner
  
  @@owners = []

  attr_accessor :owner, :pets, :name, :fishes, :cats, :dogs
  attr_reader :species

  def initialize(species)
    @species = species
    @@owners << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end

  def say_species
    return "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.map do |type, pet_array| 
      pet_array.map {|pet| pet.mood = "nervous"}
    end
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def list_pets
    return "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

end