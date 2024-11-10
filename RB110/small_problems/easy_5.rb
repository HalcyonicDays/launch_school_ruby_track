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
