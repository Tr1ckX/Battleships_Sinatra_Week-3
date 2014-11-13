require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'
require_relative './lib/water'

class BattleShips < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }
  enable :sessions
  GAME = Game.new

  get '/' do
    session[:game_id] = GAME.object_id
    erb(:index)
  end

  post '/' do
    player = Player.new(params[:player_name])
    GAME.add_player(player)
    session[:player_session_id] = player.object_id
    redirect '/ship_placement'
  end

  get '/ship_placement' do
    player = GAME.players.select{ |player| player.object_id == session[:player_session_id] }.first
    @player_name = player.name
    player.board = Board.new(Cell, Water)
    @rows = player.board.grid.values.each_slice(10).to_a
    redirect '/game' if GAME.ready?
    erb :ship_placement
  end

  post '/ship_placement' do
    player = GAME.players.select{ |player| player.object_id == session[:player_session_id] }.first
    @player_name = player.name
    shipsize = params[:ships].to_i
    ship = Ship.new(shipsize)
    orient = params[:orientation].to_sym
    coord = (params[:hor_co] + params[:ver_co]).to_sym

    @rows = player.board.grid.values.each_slice(10).to_a
    player.board.place(ship, coord, orient)
    erb :ship_placement
  end

  get '/game' do

  end

  post '/game' do

  end

end
