require './lib/cat.rb'
require './lib/dog.rb'
require './lib/fish.rb'
require 'pry'

class Owner
  attr_accessor :name, :pets, :fish, :dog, :cat
  attr_reader :species

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

  def self.reset_all
      @@all.clear
  end

  def self.count
    self.all.count
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    # binding.pry
    @pets
  end

  def buy_fish(name)
    # binding.pry
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def walk_dogs
    @pets[:dogs].map do |name|
      name.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map do |name|
      name.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].map do |name|
      name.mood = "happy"
    end
  end

  def sell_pets
    # binding.pry
    @pets[:fishes].map do |name|
      name.mood = "nervous"
    end
    @pets[:cats].map do |name|
      name.mood = "nervous"
    end
    @pets[:dogs].map do |name|
      name.mood = "nervous"
    end
    @pets.clear
  end

  def list_pets
    # binding.pry
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end



end
