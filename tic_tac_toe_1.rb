
def init
  score_arr = Array.new(9, ' ')
  print_grid(score_arr)
  show_prompt(score_arr)
end


def show_prompt(score_arr)
  puts ""
  puts "Choose a position (from 1 to 9) to place a piece:"
  take_turn(score_arr)
end


def take_turn(score_arr)
  choice = gets.chomp
  score_arr[choice.to_i - 1] = 'X'
  computer_take_turn(score_arr)
  print_grid(score_arr)
  check_for_winner(score_arr)
end


def computer_take_turn(score_arr)
  computer_choices = []
  score_arr.each_with_index do |score, idx|
    if score == ' '
      # score_arr[idx] = 'O'
      # break
      computer_choices << idx
    end
  end
  computer_choices.shuffle!
  score_arr[computer_choices[0]] = 'O'
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


#declare winner

def check_for_winner(score_arr = [])
  computer_wins = false
  user_wins = false
  if score_arr[0] == 'X' && score_arr[1] == 'X' && score_arr[2] == 'X'
    user_wins = true
  elsif score_arr[3] == 'X' && score_arr[4] == 'X' && score_arr[5] == 'X'
    user_wins = true

  elsif score_arr[6] == 'X' && score_arr[7] == 'X' && score_arr[8] == 'X'
    user_wins = true

  elsif score_arr[6] == 'X' && score_arr[4] == 'X' && score_arr[2] == 'X'
    user_wins = true

  elsif score_arr[0] == 'X' && score_arr[4] == 'X' && score_arr[8] == 'X'
      user_wins = true

  elsif score_arr[0] == 'X' && score_arr[3] == 'X' && score_arr[6] == 'X'
      user_wins = true

  elsif score_arr[1] == 'X' && score_arr[4] == 'X' && score_arr[7] == 'X'
      user_wins = true

  elsif score_arr[2] == 'X' && score_arr[5] == 'X' && score_arr[8] == 'X'
      user_wins = true
  end

  if score_arr[0] == 'O' && score_arr[1] == 'O' && score_arr[2] == 'O'
    computer_wins = true
  elsif score_arr[3] == '0' && score_arr[4] == '0' && score_arr[5] == '0'
    computer_wins = true

  elsif score_arr[6] == 'O' && score_arr[7] == 'O' && score_arr[8] == 'O'
    computer_wins = true

  elsif score_arr[6] == 'O' && score_arr[4] == 'O' && score_arr[2] == 'O'
    computer_wins = true

  elsif score_arr[0] == 'O' && score_arr[4] == 'O' && score_arr[8] == 'O'
      computer_wins = true

  elsif score_arr[0] == 'O' && score_arr[3] == 'O' && score_arr[6] == 'O'
      computer_wins = true

  elsif score_arr[1] == 'O' && score_arr[4] == 'O' && score_arr[7] == 'O'
      computer_wins = true

  elsif score_arr[2] == 'O' && score_arr[5] == 'O' && score_arr[8] == 'O'
      computer_wins = true
  end

  if user_wins
    puts "You Win!"
  elsif computer_wins
    puts "I Win!"
  else
    show_prompt(score_arr)
  end
end


init
