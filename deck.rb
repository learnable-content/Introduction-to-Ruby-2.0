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
