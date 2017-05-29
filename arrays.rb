a = ["Matz", "Guido", "Dojo", "Choi", "John"]
b = [5, 6, 9, 3, 1, 2, 4, 7, 8, 10]

# returns the first value or 0th index of the array
puts a[0]

puts a[1]

puts b.class

puts b.shuffle.join("-")

puts a.to_s

puts a.reverse

puts a.length

puts a.sort.reverse

puts a.at(0)

puts b.fetch(0)

puts b.slice!(1)

puts b

puts b.insert(2, "Hello")