# https://fine-ocean-68c.notion.site/RB101-934e6196044d425f9b2f23830ead6534?p=cc4ccb48b6e1401f85e3c0a9180637b5&pm=s
=begin

Write a function with the signature shown below:

def is_int_array?(arr)
  true
end

- returns true if every element in an array is an integer or a float with no decimals.
- returns true if array is empty.
- returns false for every other input.

=end

def is_int_array?(arr)
  return false unless arr == [arr].flatten
  arr.each { |elm| return false unless elm == elm.to_i }

  return true
end
# I know the last line doesn't require an explicit return, but I think
# it's more clear and readable when there isn't a naked floating "true"
# at the end of the method with relatively little context for it.

# test cases
p is_int_array?([]) == true
p is_int_array?([1, 2, 3, 4]) == true
p is_int_array?([-11, -12, -13, -14]) == true
p is_int_array?([1.0, 2.0, 3.0]) == true
p is_int_array?([1, 2, nil]) == false
p is_int_array?(nil) == false
p is_int_array?("") == false
p is_int_array?([nil]) == false
p is_int_array?([1.0, 2.0, 3.0001]) == false
p is_int_array?(["-1"]) == false

def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# => [1,1,3,6,9]  # 4 is removed, then 6 is skipped and not evaluated

arr = [["Mike",99], ["Zoolander",99],["Todd",230],["Max",99], ["Abby",13],["Mildred",99] ]
p arr.sort_by { |name, score| [-score, name] }
# => ["Todd",230], ["Max",99], ["Mike",99], ["Mildred",99], ["Zoolander",99], ["Abby",13]
