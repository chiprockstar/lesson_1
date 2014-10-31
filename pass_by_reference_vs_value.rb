

def reassign(array)
  array = [0, 1]  # does not mutate the caller
                  # pass value by value
end

def append(array)
  array << 1    # mutates the caller
end             # pass reference by value

array = [0]
reassign(array)

p array

append(array)

p array
