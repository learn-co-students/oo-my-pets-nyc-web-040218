require 'pry'

class Owner
 
@@all = []
@@counter = 0

attr_accessor :name, :pets
attr_reader :species

def initialize (name)
  @name = name
  @species = "human"
  @pets = {:fishes => [], :dogs => [], :cats => []}
  @@all << self
  @@counter +=1
end

def self.all
  @@all
end 

def self.reset_all
  @@counter = 0
end

def self.count 
  @@counter
end

def say_species
  "I am a #{@species}."
end

def buy_fish(fish)
  new_fish = Fish.new(fish)
  @pets[:fishes] << new_fish
end

def buy_cat(cat)
  new_cat = Cat.new(cat)
  @pets[:cats] << new_cat

end

def buy_dog(dog)
  new_dog = Dog.new(dog)
  @pets[:dogs] << new_dog

end

def walk_dogs
#@pets[:dogs] => array => so you want to iterate
  @pets[:dogs].each do |dog_mood|
    if dog_mood.mood == "nervous" 
      dog_mood.mood = "happy"
    end
  end
end

def play_with_cats
  @pets[:cats].each do |cat_mood|
    if cat_mood.mood == "nervous" 
      cat_mood.mood = "happy"
    end
  end
end

def feed_fish
  @pets[:fishes].each do |fish_mood|
    if fish_mood.mood == "nervous" 
      fish_mood.mood = "happy"
    end
  end
end

def sell_pets
  
  @pets.each do |type, pet| 
    pet.map do |animal| 
       animal.mood = "nervous"   
      end
    pet.clear
  end
end

def list_pets
  "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
end





end