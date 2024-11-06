flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values
# are the positions in the array.
some_hash = {}
flintstones.each_with_index do |name, idx|
  some_hash[name] = idx
end

flintstones.map { |name| [name, flintstones.find_index(name)] }.to_h

flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.find_index(name)
end

# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, 
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum
ages.values.inject(:+)

# In the ages hash, remove people with age 100 and greater:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |_name, age| age < 100 }
ages.reject { |_name, age| age >= 100 }
ages.delete_if { |_name, age| age >= 100 }

# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

p ages.values.min
p ages.select { |_name, age| ages.values.min == age }

# don't do these please:
p ages.group_by { |_name, age| age }.sort { |a, b| a <=> b }.first.first
p ages.group_by { |_name, age| age }.sort { |a, b| a <=> b }.first.last.flatten

# Find the index of the first name that starts with "Be" in the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.find_index { |name| name =~ /^Be/ }

# Write code that changes the array below so that all of the names are shortened
# to just the first three characters. Do not create a new array.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name.slice(0..2) }

# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# something resembling this: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
letters = {}
statement.chars.each do |letter| 
  next unless letter in ('A'..'z')
  letters[letter] ||= 0
  letters[letter] += 1
end
# >> Note: ('A'..'z') contains more than just the letters A-Z twice.  Whoops!
# >> It's important to test these things and call ('A'..'z').to_a.size (which I did)
# >> It's *also* important to realize that 58 != 26*2 (which I failed to do)

other_letters = {}
statement.chars.uniq.each { |letter| other_letters[letter] = statement.count(letter) }
other_letters.delete(" ")

still_more_letters = {}
statement.chars.group_by { |letter| letter }.to_a.each do |slice|
  next if 
  still_more_letters[slice.first] = slice.last.size
end
still_more_letters.delete(" ")

p letters
p other_letters
p still_more_letters

# What happens when we modify an array while we are iterating over it? What would be
# output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# prints 1, then removes 1, then prints 3, removes 2, and ends
# prints 1, and then 3
# returns the numbers array => [3, 4]

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# prints 1, then removes 4, then prints 2, removes 3, and ends
# prints 1, and then 2
# returns the numbers array => [1, 2]

# In both cases we see that iterators do not work on a copy of the original array or from
# stale meta-data (length) about the array. They operate on the original array in real time.

# >> Note: This is why you DO NOT want to add elements to an array while iterating through the
# >> array.  It's a great way to end up in an infinite loop.

def titleize(str)
  str.split(" ").map { |word| word[0].upcase + word[1..-1] }.join(" ")
end

words = "the flintstones rock"
puts titleize(words)


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# Modify the hash such that each member of the Munster family has an additional "age_group"
# key that has one of three values describing the age group the family member is in (kid, 
# adult, or senior). Your solution should produce the hash below: 
resulting_hash = { 
  "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

munsters.each do |munster, m_data|
  case
  when (0..17).include?(m_data["age"])  then m_data["age_group"] = "kid"
  when (18..64).include?(m_data["age"]) then m_data["age_group"] = "adult"
  when (m_data["age"] >= 65)            then m_data["age_group"] = "senior"
  else m_data["age_group"] = "too young to exist"
  end
end

# Or the below can be used if age values cannot be below zero:
munsters.each do |munster, m_data|
  case m_data["age"]
  when 0..17  then m_data["age_group"] = "kid"
  when 18..64 then m_data["age_group"] = "adult"
  else             m_data["age_group"] = "senior"
  end
end
p munsters.inspect == resulting_hash.inspect
