number = rand(1..100)
puts "I'm thinking of a number between 1 and 100, try and guess what it is"
guess = gets.to_i
attempts = 1
until guess == number do
  if guess < number then puts "Too small, try again"
  elsif guess > number then puts "Too big, try again"
  end
  attempts += 1
  guess = gets.to_i
end
puts "Well done, you guessed my number in #{attempts} attempt#{'s' if attempts > 1}!"
