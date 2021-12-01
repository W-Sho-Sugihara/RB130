=begin
input: string & array of words
output: array of strings
goal: find the anagrams of the given string that are also part of the array

rules:
* words are anagrams of each other when they have the same number of letters and the same exact letters as each other. 
=end

class Anagram
  def initialize(string)
    @string = string.downcase
  end

  def match(arr)
    arr.select do |word| 
      word = word.downcase
      word.chars.sort == @string.chars.sort && word != @string
    end
  end
end