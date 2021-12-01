# ==================================
# Listening Device
# ==================================

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def play
    puts @recordings.last
  end

  def listen
    record(yield)    
  end
end

listener = Device.new
listener.listen { "Hello World!" }
# listener.listen
listener.play # Outputs "Hello World!"

# ==================================
# text analyzer
# ==================================

class TextAnalyzer
  def process
    file = File.open('sample_text.txt')
    yield(file.read) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |par| puts par.split("\n\n").count }
analyzer.process { |par| puts par.split("\n").count }
analyzer.process { |par| puts par.split(" ").count }

# analyzer.process {  }
# analyzer.process {  }

# ==================================
# Passing Parameters part 1
# ==================================

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |items| puts "#{items.join(', ')}"}

# ==================================
# Passing Parameters part 2
# ==================================

def after_two(arr)
  yield(arr) if block_given?
end

after_two([1,2,3,4,5]) { |_, _, *nums| puts nums}

# ==================================
# Passing Parameters part 3
# ==================================

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *a, d|
  puts a.join(' ')
  puts d
end

gather(items) do | a, *b, d|
  puts a
  puts b.join(' ')
  puts d
end

gather(items) do | a, *b|
  puts a
  puts b.join(' ')
end

# ==================================
# Method to Proc
# ==================================

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# ==================================
# Bubble Sort with Blocks
# ==================================

def bubble_sort!(array)
  loop do
    changes = false 
    1.upto(array.size - 1) do |index|
      if block_given?
        if yield(array[index - 1], array[index]) == false
          array[index - 1], array[index ] = array[index], array[index - 1]
          changes = true
        end
      elsif (array[index - 1] >= array[index])
        array[index - 1], array[index ] = array[index], array[index - 1]
        changes = true
      end
    end
    break unless changes
  end
  array
end
  

# ==================================
# 
# ==================================

# ==================================
# 
# ==================================

# ==================================
# 
# ==================================