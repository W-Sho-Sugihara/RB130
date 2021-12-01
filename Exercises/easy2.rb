# ======================================
# From-To-Step-Sequence
# ======================================

def step(start, last, inc)
  count = start
  
  while count <= last
    yield(count)
    count += inc
  end
  last
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# ======================================
# Zipper
# ======================================

def zip(arr1, arr2)
  arr1.each_with_object([]).with_index do |(e, obj), index|
    obj << [e, arr2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# ======================================
# Map
# ======================================

def map(arr)
  results = []
  arr.each { |e| results << yield(e) }
  results
end

# ======================================
# Count #2
# ======================================

def count(*args)
  args.select{ |e| yield(e) }.size
end

# ======================================
# Drop_while
# ======================================

def drop_while(arr)
  arr.size.times do |i|
    return arr[i..] unless yield(arr[i])
  end
  []
end

# ======================================
# each_with_index
# ======================================

def each_with_index(arr)
  counter = 0
  
  while counter < arr.size
    yield(arr[counter], counter)
    counter += 1
  end
  arr
end



result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# ======================================
# each_with_object
# ======================================

def each_with_object(arr, obj)
  arr.each { |e| yield(e, obj) }
  obj
end

# ======================================
# max_by
# ======================================

def max_by(arr)
  largest = arr[0]
  arr.each { |e| largest = e if yield(e) > yield(largest) }
  largest
end

# ======================================
# each_cons (Part 1)
# ======================================

def each_cons(arr)
  i = 0
  while i < arr.size - 1
    yield(arr[i], arr[i+1])
    i += 1
  end
  nil
end

# ======================================
# each_cons (Part 2)
# ======================================

def each_cons(arr, inc)
  i = 0
  while i + inc <= arr.size
    yield(arr[i], *(arr[i+1..i+inc-1]))
    i += 1
  end
  nil
end
