puts "Please enter your name:"
name = gets.chomp
puts "Hello #{name}! Did you know that your name has #{name.length} letters in it and written backwards it is '#{name.reverse.downcase.capitalize}'?"
