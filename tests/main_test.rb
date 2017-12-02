require 'minitest/autorun'
require './models/board'
require './models/sudoku'
require 'pry'

class MainTest < Minitest::Test
  def setup
    @board = Board.new
    @sudoku = Sudoku.new
  end

  def test_non_repeatable_number_on_board
    @board.set(0, 0, 6)

    assert !@board.allowed(0, 2).include?(6)
    assert !@board.allowed(2, 0).include?(6)
    assert !@board.allowed(2, 2).include?(6)
    assert @board.allowed(3, 3).include?(6)
  end

  def test_sudoku
    input.each_with_index do |row, column_index|
      row.each_with_index do |value, row_index|
        @sudoku.board.set(column_index, row_index, value.to_i) unless value == '0'
      end
    end

    assert_equal true, @sudoku.solve
  end

  private

    def input
      [
        %w[0 3 0 0 6 8 0 0 0],
        %w[0 4 0 0 0 0 0 0 1],
        %w[1 0 0 3 0 0 0 7 0],
        %w[7 2 0 0 5 0 8 0 0],
        %w[0 0 4 0 0 0 6 0 0],
        %w[8 0 0 0 0 9 2 0 0],
        %w[0 0 0 0 2 0 0 0 0],
        %w[5 0 1 0 0 0 0 0 0],
        %w[0 0 0 0 0 5 0 9 0]
      ]
    end
end
