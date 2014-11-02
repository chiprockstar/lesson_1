
  # prompt
  # user chooses p r s
  # computer chooses random p r s
  # computer determines rules
  # computer displays result
  # computer prompts to play again

require 'pry'

WINNING_RULES = {paper: 'rock', rock: 'scissors', scissors: 'paper'}

def init
  puts "Play Paper Rock Scissors!"
  choose
end

def choose
  puts "Choose one: (P/R/S)"
  user_choice = gets.chomp.upcase
  get_computer_choice(user_choice)
end


def get_computer_choice(user_choice)
  computer_choice = WINNING_RULES.keys[rand(WINNING_RULES.length)]
  find_winner(computer_choice, user_choice)
end


def find_winner(computer_choice, user_choice)
  case user_choice

  when 'P'
    if computer_choice == :paper
      puts "It's a tie. \n You picked paper and the computer picked paper."

    elsif computer_choice == :rock
      puts "You picked paper and the computer picked rock. \n Paper wraps rock. \n You won!"


    elsif computer_choice == :scissors
      puts "You picked paper and the computer picked scissors. \n Scissors cut paper. \n Computer won!"

    end

  when 'R'
    if computer_choice == :rock
      puts "It's a tie. \n You picked rock and the computer picked rock."

    elsif computer_choice == :paper
      puts "You picked rock and the computer picked paper. \n Paper wraps rock. \n Computer won!"


    elsif computer_choice == :scissors
      puts "You picked rock and the computer picked scissors. \n Rock smashes scissors \n You won!"

    end

  when 'S'
    if computer_choice == :scissors
      puts "It's a tie. \n You picked scissors and the computer picked scissors."

    elsif computer_choice == :paper
      puts "You picked scissors and the computer picked paper. \n Scissors cut paper. \n You won!"


    elsif computer_choice == :rock
      puts "You picked scissors and the computer picked rock. \n Rock smashes scissors. \n Computer won!"

    end

  end
play_again
end



def play_again
  puts "Play again? (Y/N)"
  play = gets.chomp.upcase
  if play == 'Y'
    choose
  end
end

init
