class Animal
  def initialize(name="Animal")
    @name = name
    puts "An animal has been born"
  end
  
  def say_hello
    "Hello! My name is #{ @name }"
  end
  
  def speed
    @speed
  end
  
  def speed=(value)
    @speed = value
  end

  attr_reader :strength
  attr_writer :strength
  
  attr_accessor :agility
end


