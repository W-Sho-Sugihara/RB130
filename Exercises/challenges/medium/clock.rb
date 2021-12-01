class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes = 0)
    @hours = hours % 24
    @minutes = minutes
  end
  
  def self.at(hours, mins = 0)
    new(hours, mins)
  end

  def to_s
    "#{hours.to_s.rjust(2,'0')}:#{minutes.to_s.rjust(2,'0')}"
  end

  def +(num)
    self.hours, self.minutes = (hours * 60 + minutes + num).divmod(60)
    self.hours = hours % 24
    self
  end

  def -(num)
    self.hours, self.minutes = (hours * 60 + minutes - num).divmod(60)
    self.hours = hours % 24
    self
  end

  def ==(other)
    (hours * 60 + minutes) == (other.hours * 60 + other.minutes)
  end
end