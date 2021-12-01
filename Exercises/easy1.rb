# ======================================
# TREE
# ======================================

class Tree
  include Enumerable

  # attr_reader :value
  # attr_accessor :left, :right

  # def initialize(value)
  # @value = value
  # @left = nil
  # @right = nil
  # end

  def each
    # ...
  end
end

# ======================================
# Optional Blocks
# ======================================

def compute(n)
  return "Does not compute." unless block_given?
  yield(n)
end

compute(5) {|n| n ** n}
compute('Hi') { |n| puts n}
compute(0)

# ======================================
# FIND THE MISSING NUMBERS
# ======================================

def missing(arr)
  (arr.first ..arr.last).to_a - arr
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

# ======================================
# DIVISORS
# ======================================

def divisors(num)
  divs = []
  1.upto(num) do |n|
    divs << n if num % n == 0
  end
  divs
end

# further exploration
def divisors(num)
  divs = []
  results = []

  1.upto(Math.sqrt(num).abs) do |n|
    divs << n << num/n if num % n == 0
  end

  divs.uniq.sort
end



divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# ======================================
# Encrypted Pioneers
# ======================================

Alphabet = ('a'..'z').to_a

def encrypted_pioneers(pioneer)
  names = pioneer.split
  names.map do |name|
    name.chars.map do |let|
      uppercase = Alphabet.include?(let) ? false : true
      index = (Alphabet.index(let.downcase) + 13) % 26
      let = Alphabet[index]
      uppercase ? let.upcase : let
    end.join
  end.join(' ')
end

p encrypted_pioneers('Nqn Ybirynpr')
p encrypted_pioneers('Tenpr Ubccre')
p encrypted_pioneers('Nqryr Tbyqfgvar')
p encrypted_pioneers('Nyna Ghevat')
p encrypted_pioneers('Puneyrf Onoontr')
p encrypted_pioneers('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
p encrypted_pioneers('Wbua Ngnanfbss')
p encrypted_pioneers('Ybvf Unvog')
p encrypted_pioneers('Pynhqr Funaaba')
p encrypted_pioneers('Fgrir Wbof')
p encrypted_pioneers('Ovyy Tngrf')
p encrypted_pioneers('Gvz Orearef-Yrr')
p encrypted_pioneers('Fgrir Jbmavnx')
p encrypted_pioneers('Xbaenq Mhfr')
p encrypted_pioneers('Fve Nagbal Ubner')
p encrypted_pioneers('Zneiva Zvafxl')
p encrypted_pioneers('Lhxvuveb Zngfhzbgb')
p encrypted_pioneers('Unllvz Fybavzfxv')
p encrypted_pioneers('Tregehqr Oynapu')

# ======================================
# Iterators: True for any?
# ======================================

def any?(arr)
  counter = 0

  while counter < arr.size
    return true if yield(arr[counter])
    counter += 1
  end
  false
end

# ======================================
# Iterators: True for all?
# ======================================

def all?(arr)
  counter = 0

  while counter < arr.size
    return false unless yield(arr[counter])
    counter += 1
  end
  true
end

# ======================================
# Iterators: True for none?
# ======================================

def none?(arr)
  arr.each { |e| return false if yield(e) }
  true
end

def none?(collection, &block)
  !any?(collection, &block)
end

# ======================================
# Iterators: True for one?
# ======================================

def one?(arr)
  results = []
   arr.each do |e|
     results << true if yield(e)
     return false if results.size > 1
   end
   results.size == 1
 end

 # ======================================
# Iterators: Count
# ======================================

def count(arr)
  results = []
  arr.each { |e| results << e if yield(e) }
  results.size
end

 #further exploration: no loop, while, until, each

def count(arr)
  arr.select { |e| e if yield(e) }.size
end

