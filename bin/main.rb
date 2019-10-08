#!/usr/bin/env ruby 

class Player
  attr_accessor :id
  attr_accessor :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

class TicTacToe
  attr_accessor :board
  attr_accessor :players
  attr_accessor :turn

  def initialize(players)
    @players = []
    @players[0] = players[0]
    @players[1] = players[1]
    @board = (1..9).to_a
    @turn = 0
  end
  
  def set(num)
    player_id = @players[@turn % 2].id
    @board[num - 1] = player_id == 0 ? 'O' : 'X'
  end

  # check if the game is over
  def game_over?
    # minimum number of turns = 5
    # if row or colum or diagonal
    # maximum if turn == 9 
    false
  end

end

def start_game
  puts "Welcome to Tic Tac Toe game.\n\n"
  game = TicTacToe.new(ask_names)
  print_board(game)

  turn(game) until game.game_over?
end

# ask the player names
def ask_names
  players = []
  2.times do |i|
    print "Please tell us player #{i + 1} name: "
    name = gets.chomp
    # TODO: validate (min 3 letters)
    players[i] = Player.new(i, name)
  end
  players
end

# Print the keyboard with numbers from 1 to 9
def print_board(game)
  puts "#{game.board[0..2].join(" ")}"
  puts "#{game.board[3..5].join(" ")}"
  puts "#{game.board[6..8].join(" ")}" 
end

def turn(game)
  print game.players[game.turn % 2].name + ' please choose a number: '
  num = gets.chomp
  puts num

  game.set(num.to_i)

  # if num >= 1 && num <= 9) do
  #   puts 'Number already choosen';
  # end

  game.turn += 1
  print_board(game)
end

game = start_game
