require 'pry'
require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
@@all = []
  attr_reader :name, :species
  attr_accessor :reset_all
  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
    @reset_all = reset_all
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each
    binding.pry
  end


end


  