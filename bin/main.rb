#!/usr/bin/env ruby

require './lib/TicTacToe'
require './lib/Player'

def start_game
  puts "Welcome to Tic Tac Toe game.\n\n"
  game = TicTacToe.new(get_player_names)
  print_game_board(game)

  turn(game) until game.game_over?
end

def get_player_names
  players = []
  2.times do |i|
    print "Please tell us player #{i + 1} name: "
    name = gets.chomp
    # TDO: valOidate (only letters - min 3)
    # http://ruby.bastardsbook.com/chapters/exception-handling/
    players[i] = Player.new(i, name)
  end
  players
end

def print_game_board(game)
  puts "\n"
  puts "#{game.board[0..2].join(" | ")}"
  puts "#{game.board[3..5].join(" | ")}"
  puts "#{game.board[6..8].join(" | ")}"
  puts "\n"
end

def turn(game)
  # TODO: validate (only number, min 1 && max 1, available number)
  # http://ruby.bastardsbook.com/chapters/exception-handling/
  player_id = game.turn % 2
  print game.players[player_id].name + ' please choose a number: '
  num = gets.chomp
  puts num

  game.set(num.to_i)

  # if num >= 1 && num <= 9) do
  #   puts 'Number already choosen';
  # end

  game.turn += 1
  print_game_board(game)
  end_game if game.game_over?
end

def end_game(winner)
  # puts "Congratulation #{players[turn % 2].name} you win!"
  if winner
    puts "Congratulation #{winner.name} you win!"
  else
    puts "We have a draw!"
  end

  puts "\nWant to play again? [Y/n]"
  play_again = gets.chomp

  start_game unless play_again.eql?('n')
end

game = start_game
