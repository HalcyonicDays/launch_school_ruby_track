def ascii_value(str)
  str.chars.map { |char| char.ord }.inject(:+) || 0
end

def ascii_value(str)
  sum = 0
  str.chars { |char| sum += char.ord }
  sum
end
# str.ord.char == str
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

MINUTES_IN_AN_HOUR = 60
HOURS_IN_A_DAY = 24

def time_of_day(minutes_offset)
  total_hours, minutes = minutes_offset.divmod(MINUTES_IN_AN_HOUR)
  hours = total_hours % HOURS_IN_A_DAY
  "#{sprintf('%.2d:%.2d', hours, minutes)}"
end

puts "Midnight 1 tests:"
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"


def after_midnight(time)
  hours, minutes = time.split(':')
  hours_to_add = (hours.to_i % HOURS_IN_A_DAY) * MINUTES_IN_AN_HOUR
  hours_to_add + minutes.to_i
end

def before_midnight(time)
  return after_midnight(time) if after_midnight(time).zero?
  (HOURS_IN_A_DAY * MINUTES_IN_AN_HOUR) - after_midnight(time)
end

puts "Midnight 2 tests:"
p after_midnight('00:00') == 0
p after_midnight('00:01') == 1
p after_midnight('24:00') == 0
p after_midnight('12:34') == 754
p before_midnight('00:00') == 0
p before_midnight('24:00') == 0
p before_midnight('12:34') == 686
