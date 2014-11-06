require 'pry'



def init
  score_arr = Array.new(9, ' ')
end

def winning_arr
  winning_lines = [[0,1,2], [3,4,5], [6,7,8], [6,4,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8]]
end

def print_grid(score_arr = [])

    system "clear"
    puts "     |     |"
    puts "  #{score_arr[0]}  |  #{score_arr[1]}  |  #{score_arr[2]}   "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{score_arr[3]}  |  #{score_arr[4]}  |  #{score_arr[5]}   "
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{score_arr[6]}  |  #{score_arr[7]}  |  #{score_arr[8]}   "
    puts "     |     |"

end



def player_take_turn(score_arr)
  puts ""
  puts "Choose a position (from 1 to 9) to place a piece:"
  choice = gets.chomp
  score_arr[choice.to_i - 1] = 'X'

end


def computer_take_turn(score_arr, winning_lines)
  block_move = false
  computer_choices = []

  winning_lines.each do |line|
    # home grown AI to block from user becoming a winner - either lose or tie
    if score_arr.values_at(*line).count('X') == 2
       score_arr[line[0]] = 'O' if score_arr[line[0]] == ' '
       score_arr[line[1]] = 'O' if score_arr[line[1]] == ' '
       score_arr[line[2]] = 'O' if score_arr[line[2]] == ' '
       block_move = true
    end
  end

  score_arr.each_with_index do |score, idx|
    if score == ' '
      computer_choices << idx
    end
  end

  if block_move == false
    computer_choices.shuffle!
    score_arr[computer_choices[0]] = 'O'
  end

end





#declare winner

def check_for_winner(score_arr, winning_lines)

  winning_lines.each do |line|

    if score_arr.values_at(*line).count('X') == 3

      return "You Win!"

    elsif score_arr.values_at(*line).count('O') == 3

      return "I Win!"

    end
  end
  nil

end


score_arr = init
winning_lines = winning_arr

begin
  print_grid(score_arr)
  player_take_turn(score_arr)
#  print_grid(score_arr)
  computer_take_turn(score_arr, winning_lines)
  print_grid(score_arr)
  winner = check_for_winner(score_arr, winning_lines)
#  print_grid(score_arr)
end until winner || score_arr.include?(" ") == false


if winner
  puts winner
else
  puts "It's a tie."
end
