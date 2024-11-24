def joinor(arr, delimiter=', ', conjunction='or')
  if arr.size < 2
    arr.join(delimiter)
  elsif arr.size == 2
    arr.join(" #{conjunction} ")
  else
    arr[-1] = arr.last.to_s.prepend("#{conjunction} ")
    arr.join(delimiter)
  end
end

p joinor([1])                     == "1"
p joinor([1, 2])                  == "1 or 2"
p joinor([1, 2, 3])               == "1, 2, or 3"
p joinor([1, 2, 3], '; ')         == "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')  == "1, 2, and 3"
