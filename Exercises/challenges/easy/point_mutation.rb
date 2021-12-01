class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    mutations = 0
    shorter_length = strand.size < strand2.size ? strand.size : strand2.size
    shorter_length.times do |i|
      mutations +=1 if strand[i] != strand2[i]
    end
    mutations
  end
end