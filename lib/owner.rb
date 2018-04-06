class Owner

  @@all = []

  attr_accessor :name, :pets, :fish_count, :dog_count, :cat_count
  attr_reader :species
  attr_writer

  def initialize(name)
    @name = name
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
    @species = "human"
    @fish_count = 0
    @dog_count = 0
    @cat_count = 0
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
    @fish_count += 1
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
    @dog_count += 1
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
    @cat_count += 1
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets.each do |type, animal|
      pets[type].each {|pet| pet.mood = "nervous"}
    end
    pets.clear
  end

  def list_pets
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
