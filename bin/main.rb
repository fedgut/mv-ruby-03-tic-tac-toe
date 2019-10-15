#!/usr/bin/env ruby

require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'

def start_game
  puts "Welcome to Tic Tac Toe game.\n\n"
  game = TicTacToe.new(get_player_names)
  print_game_board(game)

  turn(game) until game.game_over?
end

def get_player_names
  accept_players = nil
  players = []
  until accept_players
    2.times do |i|
      accept_name = nil
      until accept_name
        print "Please tell us player #{i + 1} name: "
        name = gets.chomp.gsub(/\d|\W/, "") 
        if name.length < 3
          puts 'Please enter at least 3 A-Z-only characters'
        else 
          accept_name = true
        end
      end
      players[i] = Player.new(i, name)
    end
    if players[0].name.downcase.eql?(players[1].name.downcase)
      puts 'Players cant have the same name!'
    else
      accept_players = true
    end
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

  input = ''

  loop do
    err = nil

    print game.current_player.name + ' please choose an unused digit: '
    input = gets.chomp

    if input.length != 1 || /\D/.match(input)
      err = "\n\n #{input} is not a digit \n\n" 
      puts err
    else
      unless game.board.include?(input.to_i)
        err = "\n\n number #{input} was already used \n\n"
        puts err
      end
    end

    break unless err
  end

  game.set(input.to_i)
  print_game_board(game)
  end_game(game) if game.game_over?
  
end

def end_game(game)
  if game.status.eql? game.enum_status[:win]
    puts "Congratulation #{game.current_player.name} you win!"
  else
    puts "We have a draw!"
  end


  ans = nil
  until ans 
    puts "\nWant to play again? [Y/n]"
    play_again = gets.chomp
    if ['n', 'no', 'nah', 'nop', 'never'].include?(play_again.downcase)
       finish 
       ans = true
    elsif ['y', 'yes', 'yah', 'yay'].include?(play_again.downcase)
       start_game
       ans = true
   end
  end
end

def finish
  puts "\n\nThanks for playing Tic Tac Toe!"
end

begin
  game = start_game
rescue Interrupt
  finish
end
