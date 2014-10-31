# a = "hi there"
# b = a
# a = "not here"

#p b



# a = "hi there"
# b = a
# a << ", Bob!" #mutates the caller

#p b


# a = [1, 2, 3, 3]
# b = a
# c = a.uniq

# p a
# p b
# p c



# a = [1, 2, 3, 3]
# b = a
# c = a.uniq!  #mutates the caller

# p a
# p b
# p c


# def test(b)
#   b.map {|letter| "I like the letter: #{letter}"}
# end
#
# a = ['a', 'b', 'c']
# p test(a)
#
# p a


def test(b)
  b.map! {|letter| "I like the letter: #{letter}"} #mutates the caller
end

a = ['a', 'b', 'c']
p test(a)

p a
