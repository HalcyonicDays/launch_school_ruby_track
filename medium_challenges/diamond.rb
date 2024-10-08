# Create a diamond of n height & width (a square)
# will likely need String#ljust and String#rjust to
# center-justify each row.

# A = 1 row, B = 3 rows, C = 5 rows; 
# rows  = (alphabetical letter position * 2 -1)
# width = (alphabetical letter position * 2 -1)
# letter position in a row = 
#   first & last (0 & -1) for target letter, n
#   1 & -2 for n-1 letter
#   A appears at alphabetical letter position

# Update: it should be sufficient just to use String#rjust and
# knowledge of the letter's index relative to the target letter 
# to calculate white-space-offsets and String#<< the right letter


class Diamond
  
  def self.make_diamond(letter)
    @letter = letter.to_s
    capitalized = determine_case(letter)
    print_diamond(letter_index(letter))
  end

  def self.letter_position(letter)
    count = 1
    'A'.upto('Z') do |l|
      break if l == letter
      count +=1
    end
    count
  end

  def self.letter_index(letter)
    alphabet = ('A'..'Z').to_a
    alphabet.index(letter) + 1
  end

  def self.faster_letter_index(letter)
    alphabet = ('A'..'Z').to_a.each_with_index.to_h
    alphabet[letter]
  end

  def self.determine_case(letter)
    letter == letter.upcase
  end

  def self.print_diamond(width, capitalized=true)
    diamond = ''
    count = width - 1
    count.times { |n| diamond << ' ' }
    diamond << "A\n"
    
    'B'.upto('Z') do |letter|  
      diamond << ' ' << letter
      (count*2-1).times { |n| diamond << ' ' }
      diamond << "#{letter}\n"
      break if count >= width
      count += 1
    end

    # count.times { |n| diamond << ' ' }
    # diamond << 'A'
    puts diamond
  end

end

Diamond.make_diamond('C')

=begin
    A       A at 5
   B B      B at 4,6
  C   C     C at 3, 7
 D     D    D at 2, 8
E       E   E at 1, 9
 D     D    D at 2, 8
  C   C     C at 3, 7
   B B      B at 4,6
    A       A at 5
=end

