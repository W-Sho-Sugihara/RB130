class BeerSong

  def self.verse(num)
    case num
    when(2..99)
      "#{bottles_string(num)} of beer on the wall, #{bottles_string(num)} of beer.\n" \
      "Take one down and pass it around, #{bottles_string(num-1)} of beer on the wall.\n" \
    when 1
      "#{bottles_string(num)} of beer on the wall, #{bottles_string(num)} of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n" \
    end
  end

  def self.verses(start, fin)
    results = []
    start.downto(fin) do |num|
      results << self.verse(num)
    end
    results.join("\n")
  end

  def self.lyrics
    results = ""
    99.downto(0) do |num|
      results << self.verse(num)
    end
    results
  end

  def self.bottles_string(num)
    case num
    when (2..99) then "#{num} bottles"
    when 1       then "1 bottle"
    else              "No more bottles"
    end
  end

end