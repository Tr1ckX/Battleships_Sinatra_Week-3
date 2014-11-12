require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/board'
require_relative './lib/cell'
require_relative './lib/ship'

class BattleShips < Sinatra::Base

  set :views, Proc.new { File.join(root, "..", "views") }

  GAME = Game.new

  get '/' do
    erb(:index)
  end

  post '/' do
    GAME.add_player(Player.new(params[:player_name]))

    redirect '/ship_placement'
  end

  get '/ship_placement' do
    @player_name = GAME.player1.name
    GAME.player1.board = Board.new(Cell)
    erb(:ship_placement)
  end

  post '/ship_placement' do
    shipsize = params[:ships].to_i
    ship = Ship.new(shipsize)
    orient = params[:orientation].to_sym
    coord = (params[:hor_co] + params[:ver_co]).to_sym

    GAME.player1.board.place(ship, coord, orient)
    # erb :ship_placement
  end

end
