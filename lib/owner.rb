require 'pry'

class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
    @@all << self
  end

  def self.name
    @name = self
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def buy_cat(cat)
    cat = Cat.new(cat)
    @pets[:cats] << cat
  end

  def buy_dog(dog)
    dog = Dog.new(dog)
    @pets[:dogs] << dog
  end

  def buy_fish(fish)
    fish = Fish.new(fish)
    @pets[:fishes] << fish
  end

  def self.count
    @@all.count
  end

  def species
    @species
  end

  def say_species
    "I am a #{species}."
  end

  def walk_dogs
    pets[:dogs].map do |name|
      name.mood = "happy"
    end
  end

  def play_with_cats
    pets[:cats].map do |animal|
      animal.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].map do |animal|
      animal.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |type, name|
      name.collect do |animal|
        animal.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
