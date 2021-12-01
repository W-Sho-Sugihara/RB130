class Robot
  @@names = []

  def name
    if @name.nil?
      reset
    else
      @name
    end
  end

  def generate_name
    name = ''
    2.times { |_| name << ('A'..'Z').to_a.sample }
    3.times { |_| name << ('0'..'9').to_a.sample }
    name
  end

  def reset
    
    sample_name = nil
    loop do
      sample_name = generate_name
      break unless @@names.include?(sample_name)
    end
    @@names << sample_name
    @name = sample_name
  end
end