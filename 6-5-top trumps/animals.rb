class Animal
  attr_reader :strength, :speed, :agility
  
  def description
    "#{ @type.capitalize } #{ self.class }"
  end
  
  def image
    "/#{ self.class.to_s.downcase }.png"
  end
  
  def beats?(animal, ability)
    self.send(ability) >= animal.send(ability)
  end

end

class Duck < Animal
 def initialize(type)
    @type = type
    @strength = case type
      when 'zombie' then rand(6..10)
      when 'barbarian' then rand(5..8)
      when 'vampire' then rand(2..9)
      else rand(1..3)
    end + 5
    
    @speed = case type
      when 'zombie' then rand(-3..2)
      when 'barbarian' then rand(2..5)
      when 'vampire' then rand(6..10)
      else rand(1..3)
    end + 6
    
    @agility = case type
      when 'zombie' then rand(-2..3)
      when 'barbarian' then rand(3..4)
      when 'vampire' then rand(2..7)
      else rand(1..3)
    end + 3
  end
end

class Cow < Animal
   def initialize(type) 
    @type = type   
    @strength = case type
      when 'zombie' then rand(6..10)
      when 'barbarian' then rand(5..8)
      when 'vampire' then rand(2..9)
      else rand(1..3)
    end + 9
    
    @speed = case type
      when 'zombie' then rand(-3..2)
      when 'barbarian' then rand(2..5)
      when 'vampire' then rand(6..10)
      else rand(1..3)
    end + 2
    
    @agility = case type
      when 'zombie' then rand(-2..3)
      when 'barbarian' then rand(3..4)
      when 'vampire' then rand(2..7)
      else rand(1..3)
    end + 3
  end
end

class Monkey < Animal
 def initialize(type)
    @type = type  
    @strength = case type
      when 'zombie' then rand(6..10)
      when 'barbarian' then rand(5..8)
      when 'vampire' then rand(2..9)
      else rand(1..3)
    end + 3
    
    @speed = case type
      when 'zombie' then rand(-3..2)
      when 'barbarian' then rand(2..5)
      when 'vampire' then rand(6..10)
      else rand(1..3)
    end + 6
    
    @agility = case type
      when 'zombie' then rand(-2..3)
      when 'barbarian' then rand(3..4)
      when 'vampire' then rand(2..7)
      else rand(1..3)
    end + 9
  end
end
