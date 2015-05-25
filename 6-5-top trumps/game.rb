require 'sinatra'
require './animals'

enable :sessions

helpers do
  require './helpers.rb'
end

get '/' do
  cards = get_cards
  deal cards
  redirect to('/play')
end

get '/play' do
  @player_card = session[:card] = session[:player].shift
  @computer_card = session[:card2] = session[:computer].shift
  erb :game
end

get '/play/:attribute' do
  @player_card = session[:card]
  @computer_card = session[:card2]
  if @player_card.beats?(@computer_card,params[:attribute])
    player_wins @player_card,@computer_card
    if player_wins?
       erb :win_game
    else
      erb :win_card
    end
  else
    player_loses @player_card,@computer_card
    if player_loses?
      erb :lose_game
    else
      erb :lose_card
    end
  end
end
