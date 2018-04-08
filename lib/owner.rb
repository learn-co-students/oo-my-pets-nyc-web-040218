require "pry"
class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.owner
    Owner.new(species)
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(fish_name)
    new_fish_instance = Fish.new(fish_name)
    @pets[:fishes] << new_fish_instance
  end

  def buy_dog(dog_name)
    new_dog_instance = Dog.new(dog_name)
    @pets[:dogs] << new_dog_instance
  end

  def buy_cat(cat_name)
    new_cat_instance = Cat.new(cat_name)
    @pets[:cats] << new_cat_instance
  end

  def make_pets_happy(pet_type)
    @pets[pet_type].each do |pet_instance|
      pet_instance.mood = "happy"
    end
  end

  def walk_dogs
    make_pets_happy(:dogs)
  end

  def play_with_cats
    make_pets_happy(:cats)
  end

  def feed_fish
    make_pets_happy(:fishes)
  end

  def sell_pets
    @pets.each do |pet_name, pet_instances|
      pet_instances.each do |pet_instance|
        pet_instance.mood = "nervous"
      end
      pet_instances.clear
    end
  end

  def list_pets
    fish_count = 0
    cat_count = 0
    dog_count = 0

    @pets.each do |pet_name, pet_instances|
      if pet_name == :fishes
        fish_count = pet_instances.length
      elsif pet_name == :cats
        cat_count = pet_instances.length
      else
        dog_count = pet_instances.length
      end
    end

    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all.clear
  end
end
