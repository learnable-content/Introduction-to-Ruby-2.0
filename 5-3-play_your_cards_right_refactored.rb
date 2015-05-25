require 'sinatra'
enable :sessions

helpers do
  
  def set_up_game
    session[:deck] = []
    suits = %w[ Hearts Diamonds Clubs Spades ]
    values = %w[ Ace 2 3 4 5 6 7 8 9 10 Jack Queen King ]
    suits.each do |suit|
      values.each do |value|
        session[:deck] << "#{value} of #{suit}"
      end
    end
    session[:deck].shuffle!
    session[:guesses] = -1
  end
  
  def value_of card
    case card[0]
      when "J" then 11
      when "Q" then 12
      when "K" then 13
      else card.to_i
    end
  end
  
  def player_has_a_losing value
    (params[:guess] == 'higher' and value < session[:value]) or (params[:guess] == 'lower' and value > session[:value])
  end
  
  def draw_card
    session[:deck].pop
  end
  
  def game_over card
    "Game Over! The card was the #{ card }. You managed to make #{session[:guesses]} correct guess#{'es' unless session[:guesses] == 1}. <a href='/'>Play Again</a>"
  end
  
  def update_session_with value
    session[:value] = value
    session[:guesses]  += 1
  end
  
  def ask_about card
    "The card is the #{ card }. Do you think the next card will be <a href='/higher'>Higher</a> or <a href='/lower'>Lower</a>?"
  end
end

get '/' do
  set_up_game
  redirect to('/play')
end

get '/:guess' do
  card = draw_card
  value = value_of card
    
  if player_has_a_losing value
    game_over card
  else
    update_session_with value
    ask_about card
  end
end
