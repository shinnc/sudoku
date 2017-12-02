require './models/board'

class Sudoku
  attr_accessor :board

  NUMBERS = (1..9).to_a

  def initialize
    @board = Board.new
  end

  def to_s
    @board.base.map do |r|
      r.map { |c| c.nil? ? '0' : c }.join(' ')
    end.join("\n")
  end

  def empty_number
    array = []

    9.times do |row|
      9.times do |column|
        array << [column, row] if @board.get(column, row).nil?
      end
    end

    array
  end

  def solve
    return true if empty_number.empty?

    column, row = empty_number.first
    allowed = @board.allowed(column, row).compact

    until allowed.empty?
      @board.set(column, row, allowed.shift)
      return true if solve
      @board.set(column, row, nil)
    end

    false
  end
end
