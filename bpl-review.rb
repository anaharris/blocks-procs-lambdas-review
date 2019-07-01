#bloc & yield

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
