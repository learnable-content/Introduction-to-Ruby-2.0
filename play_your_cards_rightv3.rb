require 'sinatra'
require './deck'
enable :sessions

helpers do

  def set_up_game
    session[:deck] = Deck.new
    session[:deck].shuffle
    session[:guesses] = -1
  end

  def player_loses
    (params[:guess] == 'higher' and @card.value < session[:value]) or (params[:guess] == 'lower' and @card.value > session[:value])
  end

  def game_over
    "Game Over! The card was the #{ @card.description }. You managed to make #{session[:guesses]} correct guess#{'es' unless session[:guesses] == 1}. <a href='/'>Play Again</a>"
  end

  def update_session
    session[:value] = @card.value
    session[:guesses]  += 1
  end

  def ask_about_card
    "The card is the #{ @card.description }. Do you think the next card will be <a href='/play/higher'>Higher</a> or <a href='/play/lower'>Lower</a>?"
  end
end

get '/' do
  set_up_game
  redirect to('/play/cards')
end

get '/play/:guess' do
  @card = session[:deck].draw

  if player_loses
    game_over
  else
    update_session
    ask_about_card
  end
end
