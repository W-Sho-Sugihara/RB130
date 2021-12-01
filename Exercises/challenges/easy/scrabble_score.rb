LETTER_SCORE = {
  1 => %w(A E I O U L N R S T),
  2 => ['D', 'G'],
  3 => ['B', 'C', 'M', 'P'],
  4 => ['F', 'H', 'V', 'W', 'Y'],
  5 => ['K'],
  8 => ['J','X'],
  10 => ['Q', 'Z']
}

class Scrabble
  def initialize(word)
    @word = word.nil? ? '' : word.upcase
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    score = 0
    @word.chars.each { |letter| LETTER_SCORE.each { |k, v| score += k if v.include?(letter) } }
    score
  end
end