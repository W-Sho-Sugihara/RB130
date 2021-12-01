class Diamond
  ALPHABET = ('A'..'Z').to_a
  
  def self.make_diamond(center_letter)
    width = white_space(center_letter) + 2
    cur_index = ALPHABET.index(center_letter) 
    string = ''

    if center_letter == 'A'
      string << "A\n"
    else
     ALPHABET[0...cur_index].each { |letter| string << line(letter, width)}
     ALPHABET[0..cur_index].reverse.each { |letter| string << line(letter, width)}
    end
    string
  end

  def self.white_space(letter)
    return 0 if letter == 'A'
    index = ALPHABET.index(letter)
    (index * 2) - 1
  end

  def self.line(letter, width)
    if letter == 'A'
      "A".center(width) + "\n"
    else
      "#{letter}#{' ' * white_space(letter)}#{letter}".center(width) + "\n"
    end
  end
end
