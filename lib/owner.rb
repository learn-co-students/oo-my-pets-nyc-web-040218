class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def set_pets_mood_by_type(type, string)
    pets[type].each {|pet| pet.mood=string}
    "#{type.to_s.capitalize} are feelin' #{string}!"
  end

  def walk_dogs
    set_pets_mood_by_type(:dogs, "happy")
  end

  def play_with_cats
    set_pets_mood_by_type(:cats, "happy")
  end

  def feed_fish
    set_pets_mood_by_type(:fishes, "happy")
  end

  def sell_pets
    pets.each do |type, pet_array|
      set_pets_mood_by_type(type, "nervous")
      pets[type] = []
    end
  end

  def count_pets_by_type(type)
    pets[type].length
  end

  def list_pets
    "I have #{count_pets_by_type(:fishes)} fish, #{count_pets_by_type(:dogs)} dog(s), and #{count_pets_by_type(:cats)} cat(s)."
  end

end
