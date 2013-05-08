#Exercise 1

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#array.each do |x|
#	puts x
#end

#Exercise 2

#array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#array.each {|x| puts x if x>5}

#Exercise 3

#new_array = array.select{|x| x%2==1}
#puts new_array

#Exercise 4

array << 11
array.unshift 0

#Exercise 5

array.pop
array << 3

#Exercise 6

array = array.uniq

#Exercise 7

#An array is a list of entries ordered by number, while a hash is not orderd numerically and but rather by keys with associates values for each entry. E.g., an array is a ordered list of people's weights, a hash is a list of names with their corresponding weight.

#Exercise 8
	#Ruby 1.9
#numbers = Hash[("a".."d").to_a.zip((1..4).to_a)]
	#Ruby 1.8
numbers = { "a" => 1, "b" => 2, "c" => 3, "d" => 4 } 

#Exercise 9

#puts numbers["b"]

#Exercise 10

numbers.merge!("e" => 5)

#Exercise 13

numbers.delete_if {| key, value | value < 3.5 }

#Exercise 14

#Yes, hash values can be arrays
	hash_array = { "a" => [1,2,3], "b" => [3,2,1], "c" => [2,1,3], "d" => [3,1,2] } 

#Yes, there can be arrays of hashes
	number = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}
	color = {"red" => 1, "blue" => 2, "green" => 3, "yellow" => 4}
	shape = {"circle" => 1, "square" => 2, "triangle" => 3, "oval" => 4}
	array_hash = [number, color, shape]

#Exercise 15

# Not sure if it counts, but I've found Stack Overflow to be the most helpful so far. The tagging system makes it easy to search, upvotes make it easy to find the best responses, and tons of helpful responses - I've found my exact question asked in most cases