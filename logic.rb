number = rand(1..6)

puts "You Rolled a #{number}"

puts "You rolled the highest number possible" if number == 6

puts "You didn't roll the lowest number possible" if number != 1

if number < 5 then puts "You rolled a number less than 5" end

if number.even?
  puts "You rolled an even number"
else
  puts "You rolled an odd number"
end

if    number==1 then puts "You rolled a one"
elsif number==2 then puts "You rolled a two"
elsif number==3 then puts "You rolled a three"
else puts "You rolled a number bigger than three"
end

case number
  when 4 then puts "You rolled a four"
  when 5 then puts "You rolled a five"
  when 6 then puts "You rolled a six"
  else puts "You rolled a number less than four"
end

if number== 2 or number==3 or number==5
  puts "You rolled a prime number"
end

puts "You rolled a square number" if number==1 || number==4

if number.odd? and number >= 4
  puts "You rolled a five"
end

if number.even? && number <= 3
  puts "You rolled the only even prime number"
end
