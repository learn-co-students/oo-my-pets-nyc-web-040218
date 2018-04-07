class Owner
  attr_accessor :name, :pets
  attr_reader :species

  def self.all
    @@all_owners
  end

  @@all_owners = []

  def self.count
    Owner.all.length
  end

  def self.reset_all
    Owner.all.clear
  end

  def initialize(species)
    @species = species
    Owner.all.push(self)
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    return "I am a #{self.species}."
  end

  def pets
    @pets
  end

  def buy_fish(fish)
    pets[:fishes].push(Fish.new(fish))
  end

  def buy_cat(cat)
    pets[:cats].push(Cat.new(cat))
  end

  def buy_dog(dog)
    pets[:dogs].push(Dog.new(dog))
  end

  def walk_dogs
    pets[:dogs].map{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].map{|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].map{|fish| fish.mood = "happy"}
  end
  
  def sell_pets
    pets.map do |pet_type, pet_array|
      pet_array.map {|pet| pet.mood = "nervous"}
      pet_array.clear
    end
  end

  def list_pets
    return "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end