

# a = 6
#
# 3.times do |n|
#   a = 3
# end
#
# puts a



# a) re-assigning the variable to something else

# def change(a)
#   c = a
# end
#
# a = 6
# c = 7
# 3.times do |n|
#   a = 3
#   change(a)
# end
#
# puts a
# puts c


#c) call a method that mutates the caller.

## mutates the caller

# a = [1,2,3,4,5,6,7,8,9,10]
#
# def mutate(array)
#   array.pop
# end
#
#
# puts a
# mutate a
# puts a




# b) call a method that doesn’t mutate the caller

## does not mutate the caller

# a = [1,2,3,4,5,6,7,8,9,10]
#
# def no_mutate(array)
#   array.length
# end
#
#
# p "Before #{a}"
# no_mutate(a)
# p "After #{a}"



# Create a local variable at an inner scope and try to reference it in the outer scope

a = [1,2,3,4,5,6,7,8,9,10]

a.each do |a|
  b = a
end

puts b

# throws : NameError: undefined local variable or method `b' for main:Object


a = [1,2,3,4,5,6,7,8,9,10]
f = ["a", "b", "c"]


a.each do |c|
b = []

  f.each do |g|
    b << g
  end
end

puts a
puts b

#NameError: undefined local variable or method `b' for main:Object

# What happens when you have nested do/end blocks?
#   Variable's availability in the nesting of blocks has to be in level of the definition
