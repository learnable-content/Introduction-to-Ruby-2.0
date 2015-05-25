def get_cards
  cards = []
  types = [ 'normal','zombie','barbarian','vampire' ]
  types.each do |type|
    cards << Cow.new(type)
    cards << Duck.new(type)
    cards << Monkey.new(type)
  end
  cards.shuffle!
end

def deal cards
  session[:player] = []
  session[:computer] = []
  cards.each_with_index do |card,index|
    if index.odd?
      session[:player] << card
    else
      session[:computer] << card
    end
  end
end

def player_wins *cards
  session[:player].push(cards).flatten!
end

def player_loses *cards
  session[:computer].push(cards).flatten!
end

def player_loses?
  session[:player].empty?
end

def player_wins?
  session[:computer].empty?
end
