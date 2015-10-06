class Card
  def initialize(name,suit)
    @name = name
    @suit = suit
  end

  def description
    "The #{ @name } of #{ @suit }"
  end

  def value
    case @name[0]
      when "J" then 11
      when "Q" then 12
      when "K" then 13
      else @name.to_i
    end
  end
end

class Deck
  def initialize
    @cards = []
    suits = %w[ Hearts Diamonds Clubs Spades ]
    names = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
    suits.each do |suit|
      names.each do |name|
        @cards << Card.new(name,suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end
