# calculator for additions
# Enter a first number:
1. get user to enter first number
2. store it in vaiable
3. get second number
4. store it in variable
5. calculate sum of both variables
display result

puts "enter first number"
a = gets.chomp.to_i
puts "enter second number"
b = gets.chomp.to_i
sum = a + b
puts "the sum is #{sum}"


1. get user to enter first number
2. store it in vaiable
3. get second number
4. store it in variable
5. ask user to choose operation (give options)
6. get input
5. make calculation
6. display result

loop do
puts "enter first number"
a = gets.chomp.to_i
puts "enter second number"
b = gets.chomp.to_i
puts "which operation? [+, -, *, /]"
method = gets.chomp
result = a + b if method == "+"
result = a - b if method == "-"
result = a * b if method == "*"
result = a / b if method == "/"
puts "the result is #{result}"
end
