# frozen_string_literal: true

# ./lib/Player.rb

class Player
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def valid_name?(name)
    true if name
  end
end
