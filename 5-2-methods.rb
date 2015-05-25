# basic method definition
def hello
  "Hello"
end

# using a parameter
def say_hello_to(name)
  "Hello #{name}!"
end

# using a default parameter
def say_hello_to(name="Ruby")
  "Hello #{name}"
end

# using multiple parameters, some with default values
def say_hi_to(name,job="programming language")
  "Hi #{name}! Your job as a #{job} sounds fun"
end

# using keyword arguments
def greet(name: "Ruby", greeting: "Hello", job: "programming language")
  "#{greeting} #{name}, Your job as a #{job} sounds fun"
end

# using an undefined number of parameters
def group_greeting(*names)
  names.each { |name| puts "Hello #{name}!" }
end

# using a block
def repeat(number=2,&block)
  number.times { yield }
end

# checking if a block is given
def roll(sides=6,&block)
  if block_given?
    yield(rand(1..sides))
  else
    rand(1..sides)
  end
end
