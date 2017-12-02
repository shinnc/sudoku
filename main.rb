require './models/sudoku'

sudoku = Sudoku.new

puts "
 ____            _       _          ____        _
/ ___| _   _  __| | ___ | | ___   _/ ___|  ___ | |_   _____ _ __
\\___ \\| | | |/ _` |/ _ \\| |/ / | | \\___ \\ / _ \\| \\ \\ / / _ \\ '__|
 ___) | |_| | (_| | (_) |   <| |_| |___) | (_) | |\\ V /  __/ |
|____/ \\__,_|\\__,_|\\___/|_|\\_\\\\__,_|____/ \\___/|_| \\_/ \\___|_|
"
puts ''
puts 'Enter the sudoku row by row as the following example:'
puts '0 3 0 0 6 8 0 0 0'
puts '0 4 0 0 0 0 0 0 1'
puts '1 0 0 3 0 0 0 7 0'
puts 'and so on.....'
puts ''
puts 'Input:'
puts ''

9.times do |r|
  gets.chop.split(' ').each_with_index do |value, c|
    sudoku.board.set(c, r, value.to_i) unless value == '0'
  end
end

puts ''
if sudoku.solve
  puts 'Solved:'
  puts ''
  puts sudoku
else
  puts 'Failed to solve!'
end
