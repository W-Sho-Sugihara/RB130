require 'date'

class Meetup
  attr_reader :date, :cur_month, :possible_days, :teenth

  def initialize(year, month)
    @date = Date.new(year, month)
    @cur_month = month_days(date)
    @possible_days = []
    @teenth = (13..19).to_a
  end

  def day(day_of_week, descriptor)
    iterate_days = date
    cur_month.times do |_|
      possible_days << iterate_days if iterate_days.wday == days_to_digits(day_of_week)
      iterate_days = iterate_days.next_day
    end
    
    descriptor_result(descriptor)
  end
  
  def descriptor_result(descriptor)
   case descriptor.downcase
     when 'first'  then possible_days[0]
     when 'second' then possible_days[1]
     when 'third'  then possible_days[2]
     when 'fourth' then possible_days[3]
     when 'fifth'  then possible_days[4]
     when 'last'   then possible_days[-1]
     when 'teenth' then possible_days.select { |day| teenth.include?(day.day) }.first
     end
  end

  def days_to_digits(day_of_week)
    case day_of_week.downcase
    when 'monday'   then 1
    when 'tuesday'  then 2
    when 'wednesday'then 3
    when 'thursday' then 4
    when 'friday'   then 5
    when 'saturday' then 6
    when 'sunday'   then 0
    end
  end
      
  def month_days(date)
    if [1,3,5,7,8,10,12].include?(date.month)
     31
    elsif [4,6,9,11].include?(date.month)
      30
    else
      Date.leap?(date.year) ? 29 : 28
    end
  end
end

meet = Meetup.new(2021, 11)
puts meet.day('monday', 'first')      