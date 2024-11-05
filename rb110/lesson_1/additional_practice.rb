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
