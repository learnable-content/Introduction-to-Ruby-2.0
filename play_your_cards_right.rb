require 'sinatra'
enable :sessions

get '/' do
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
  redirect to('/play/cards')
end

get '/play/:guess' do
  card = session[:deck].pop

  value = case card[0]
    when "J" then 11
    when "Q" then 12
    when "K" then 13
    else card.to_i
  end

  if (params[:guess] == 'higher' and value < session[:value]) or (params[:guess] == 'lower' and value > session[:value])
    "Game Over! The card was the #{ card }. You managed to make #{session[:guesses]} correct guess#{'es' unless session[:guesses] == 1}. <a href='/'>Play Again</a>"
  else
    session[:guesses]  += 1
    session[:value] = value

    "The card is the #{ card }. Do you think the next card will be <a href='/play/higher'>Higher</a> or <a href='/play/lower'>Lower</a>?"
  end
end
