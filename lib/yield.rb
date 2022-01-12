array1 = [1, 2, 3]
array2 = []

array1.each do |n|
  array2 << n * 2
end

# puts array2

def each #no argument is given as the block is passed to the method implicitly
  i = 0
  while i < size
    yield at(i) #yield is called to execute the passed block for every element
    i += 1
  end
end

# array1.each { |n| puts "#{n}!" }

def each_explicit(&block) #block automatically converted to a proc
  i = 0
  while i < size
    block.call at(i)
    i += 1
  end
end


def run_proc_with_random_number(proc)
  random = 25
  proc.call(random)
end

proc = Proc.new { |n| puts "#{n}!" }
# run_proc_with_random_number(proc)

# def run_proc_with_random_number(&proc)
#   random = 25
#   proc.call(random)
# end
#
# run_proc_with_random_number { |n| puts "#{n}!" }

# Note: While it's useful to have the proc in the method in some situations,
#  the conversion of a block to a proc produces a performance hit. Whenever
#  possible, use implicit blocks instead.

def one_yield
  yield
end

# one_yield { puts "one yield" }

def multiple_yields
  yield
  yield
end

# multiple_yields { puts "multiple yields" }

def no_block_given
  yield
end

# puts no_block_given

def optional_block
  yield if block_given?
end

# optional_block
# puts optional_block.nil?

def yield_with_arguments
  a = "Hello"
  b = "World!"

  yield(a, b)
end

# yield_with_arguments { |a,b| puts "#{a} #{b}" }

def yield_with_return_value
  return_value = yield
  # return_value = yield if block_given?

  puts return_value
end

# yield_with_return_value
# yield_with_return_value { "Hello World!" }
