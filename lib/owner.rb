require 'pry'

class Owner

  attr_reader :species
  attr_accessor :name, :pets

  ALL = []

  def initialize(species)
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
      }
    ALL << self
    @species = species
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

  def say_species
    "I am a #{self.species}."
  end

  def pets
    @pets
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    @pets[:fishes] << new_fish
  end

  def feed_fish
    @pets[:fishes].map!{|fish| fish.mood = "happy"}
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    @pets[:cats] << new_cat
  end

  def play_with_cats
    @pets[:cats].map!{|cat| cat.mood = "happy"}
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs].map!{|dog| dog.mood = "happy"}
  end

  def sell_pets
    @pets.each do |type_of_pet, pet_array|
      pet_array.map!{|pet| pet.mood = "nervous"}
    end
    @pets.each do |type_of_pet, pet_array|
      pet_array.clear
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
