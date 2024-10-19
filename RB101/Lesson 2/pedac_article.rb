
def request_target
  puts "please input a target number: \n"
  target = gets.to_i  
end

def request_factors
  puts "would you like to specify factor(s)? (y/n) "
  answer = gets.chomp
  case answer
  when 'y'
    puts "please input a factor: \n"
    factors = Array.new << gets.to_i
    loop do
      puts "please specify an additional factor or anything else to move on: \n"
      answer = gets.to_i
      answer > 0 ? factors.push(answer) : break
    end
  when 'n'
    factors = [3,5]
  else
    puts "I didn't understand that.\n"
    request_factors
  end
  factors.sort
end

=begin
This class was created in an effort to end up with a function call 
that looked like "n.is_factor?(factors)" instead of "is_factor?(n, factors)"
but failed because "n" is an interger temporarily generated as part of the
#upto method.  If I were to try to refactor this again, I would instead 
aim for "factor.is_factor?(n)" since I think this both reads better, and
because it is reasonable for "factor" to be a class (or part of a class)
and respond to a custom methodin a way that is not reasonable for 
the "n" iterator that is part of the #upto block.
class Target
  attr_reader :value

  def initialize(target, factors=[3,5])
    @target = target
    @factors = factors
  end

  def collect_factors
    values = []
    1.upto(target) { |n| summation += n if is_factor?(n, factors) }
  end

  def is_factor?(factors)
    factors.each { |factor| return true if @value % factor == 0 }
    return false
  end
end
=end

def is_factor?(number, factors)
  factors.each do |factor|
    return true if number % factor == 0
  end
  false
end

#target  = Target.new(request_target, request_factors)
target = request_target
factors = request_factors
summation = 0

1.upto(target-1) { |n| summation += n if is_factor?(n, factors) }

puts "The summation of values is: #{summation}."
