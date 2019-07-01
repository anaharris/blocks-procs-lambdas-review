# bloc & yield

def say_hi
  yield
end

say_hi {puts 'Hiii!'}

def say_hi_twice
  yield
  yield
end

say_hi_twice {puts 'Hello!'}

def multiply
  yield 1
  yield 2
  yield 3
end

multiply {|num| puts num * 10}

def expl_hi(&block)
  block.call
end

expl_hi { puts "Ciao!" }

def check_block
  return "No block was given" unless block_given?
  yield
end

check_block
check_block { puts 'Oh hey.'}

# lambda (can be saved as a variable)

lambda_def = -> { puts "This is a lambda." }
lambda_def.call

times_two = ->(x) { puts x * 2 }
times_two.call(2)

# procs (similar to lambda, with few differences):
# Lambdas are defined with -> {} and procs with Proc.new {}.
# Procs return from the current method, while lambdas return from the lambda itself.
# Procs don’t care about the correct number of arguments, while lambdas will raise an exception.

my_proc = Proc.new { |x| puts x}

t = Proc.new { |x, y| puts "I don't care about arguments!"}
t.call


my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"
# => Lambda result: 1

# my_proc = Proc.new { return 1 }
# puts "Proc result: #{my_proc.call}"
# =>

def call_proc
  puts "Before proc"
  my_proc = Proc.new { return 2 }
  my_proc.call
  puts "After proc"
end
p call_proc
# Prints "Before proc" but not "After proc"
