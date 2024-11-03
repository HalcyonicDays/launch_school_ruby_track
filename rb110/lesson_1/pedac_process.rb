# Sum Even Number Rows
=begin
Imagine a sequence of consecutive even integers beginning with two.
The integers are grouped in rows with the first row containing one integer,
the second row containing two integers, the third row containing three 
integers, and so on.
Given an integer representing the number of a particular row, return an integer
representing the sum of all integers in that row.

input : integer (representing row) 
output: integer (sum)

explicit requirements:
- for a given row, identify which integers are contained within that row
- for a given row, sum the integers of that row

implicit requirements:
- given some number, n, build an algorithm to identify which integer is at
  index n0, and the subsequent (n-1) following integers

questions:
- is the first row considered "row 1" or "row 0?"

example (first 3 rows):
2              sum: 2   
4  6           sum: 10  
8  10 12       sum: 30  
14 16 18 20    sum: 68
22 24 26 28 30
       Final Int  Expression
row 1    2        2*1
row 2    6        2*2 + 2*1
row 3    12       2*3 + 2*2 + 2*1
row 4    20       2*4 + 2*3 + 2*2 + 2*1

       Start Int  Expression
row 1    2        2*1 - 2*(row_num-1)                   2  - 0 = 2
row 2    4        2*2 + 2*1 - 2*(row_num-1)             6  - 2 = 4
row 3    8        2*3 + 2*2 + 2*1 - 2*(row_num-1)       12 - 4 = 8
row 4    14       2*4 + 2*3 + 2*2 + 2*1 - 2*(row_num-1) 20 - 6 = 14

potential solution:
- loop through a collection of even integers until n interations have been 
  completed; then calculate a sum for that row.
  - While that should be feasible, this solution takes longer to commuter for
    larger numbers, and there may be a mathematical expression that can
    calculate the integers (or at least starting integer) without much less
    compute time by jumping straight to the necessary row rather than counting
    upwards towards it, row-by-row.
=end

def final_int(row_num)
  sum = 0
  while row_num > 0
    sum += row_num * 2
    row_num -= 1
  end
  sum
end

def get_rowmates(row_num)
  row_ints = []
  last_int = final_int(row_num)
  
  row_num.times do
    row_ints << last_int
    last_int -= 2
  end
  row_ints.sort
end

def row_summation(row_num)
  get_rowmates(row_num).inject(:+)
end

1.upto(5) { |n| puts "row #{n} contains: #{get_rowmates(n)} " +
              "which sum to #{row_summation(n)}" }

# alternative solution would be to count through to the required row:
def count_up(target_row)
  row = 1
  starting_int = 0
  while row < target_row
    row.times { |n| starting_int += 2}
    row += 1
  end
  sum = 0
  target_row.times do 
    starting_int += 2
    sum += starting_int
  end
  sum
end
# In the above implementation, line 82 would ideally return "starting_int"
# and current lines 82-88 would be a second, separate method, but this is
# left as-is because this is already a "reverse-refactor" of the solution
# in lines 47-69, above.

1.upto(5) { |n| puts count_up(n) }
1.upto(5) { |n| puts row_summation(n) }

# count_up(10000)
# row_summation(10000)
# Running the above for a relatively high target row (e.g. 10_000) results in
# a drastically larger runtime for the "count_up" method as compared to the
# "row_summation" method.  This gap inceases at higher orders of magnitude.
