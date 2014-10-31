
def display(msg)
  puts "#{msg}"
end

display "Enter the first number."
num1 = gets.chomp

display "Enter the second number."
num2 = gets.chomp

display "1 - add, 2 - subtract, 3 - multiply, 4 - divide"
operator = gets.chomp


case operator
when '1'
  answer = num1.to_i + num2.to_i
when '2'
  answer = num1.to_i - num2.to_i
when '3'
  answer = num1.to_i * num2.to_i
when '4'
  if num2 == '0'
    display "You can't divide by 0"
  else
    answer = num1.to_f / num2.to_i
  end
else
  display "You must enter a number between 1 and 4"
end

if operator.to_i > 0 && operator.to_i < 5 && num2.to_i != 0
  display "The result is #{answer}"
end
