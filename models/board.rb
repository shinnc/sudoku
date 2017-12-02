require './models/exceptions'

class Board
  attr_accessor :base

  NUMBERS = (1..9).to_a

  def initialize(size = 9)
    # Create a 9x9 array
    @base = Array.new(size) { Array.new(size, nil) }
  end

  def get(column, row)
    @base[row][column]
  end

  def set(column, row, value)
    validate(column, row, value)

    @base[row][column] = value
  end

  def allowed(column, row)
    # Get the highest possible values
    possible_row_values(row) &
      possible_column_values(column) &
      possible_square_values(column, row)
  end

  private

    def row(row)
      @base[row]
    end

    def column(column)
      @base.map { |row| row[column] }
    end

    def possible_row_values(row)
      (NUMBERS - row(row)).uniq << nil
    end

    def possible_column_values(column)
      (NUMBERS - column(column)).uniq << nil
    end

    def possible_square_values(column, row)
      x = 3 * (column / 3)
      y = 3 * (row / 3)
      square = []

      3.times do |i|
        3.times do |j|
          square << @base[y + j][x + i]
        end
      end

      (NUMBERS - square).uniq << nil
    end

    def validate(column, row, value)
      raise InvalidRowValue, "#{value} is invalid in row #{row}" unless
        possible_row_values(row).include?(value)

      raise InvalidColumnValue, "#{value} is invalid in column #{column}" unless
        possible_column_values(column).include?(value)

      raise InvalidSquareValue, "#{value} is invalid in square at column: #{column}, row: #{row}" unless
        possible_square_values(column, row).include?(value)
    end
end
