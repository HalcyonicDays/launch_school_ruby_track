# Create a basic calculator that asks for two values
# from the user along with a desired operation

require 'yaml'

def get_language()
  'en'
end

def messages(file, language='en')
  YAML.load_file(file)[language]
end

def prompt(message)
  puts "=> #{message}"
end

def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  return a / b if b != 0
  "cannot divide by zero"
end

def valid_input?(number)
  valid_integer?(number) || valid_float?(number)
end

def valid_integer?(number)
  number.to_i.to_s == number
end

def valid_float?(number)
  number.to_f.to_s == number
end

def valid_operation?(input)
  %w[1 2 3 4].include?(input)
end

def get_operation(operation)
  { '1' => 'adding',
    '2' => 'subtracting',
    '3' => 'multiplying',
    '4' => 'dividing' }[operation]
end

MESSAGES = messages('calculator_messages.yml', get_language())

prompt(MESSAGES['welcome'])

loop do
  number1 = ''
  number2 = ''
  operation = ''

  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp
    break if valid_input?(number1)
    puts "That's not a valid number..."
  end

  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp
    break if valid_input?(number1)
    puts "That's not a valid number..."
  end
  number1 = number1.to_f
  number2 = number2.to_f

  loop do
    prompt(MESSAGES['operation'])
    operation = gets.chomp
    break if valid_operation?(operation)
    prompt(MESSAGES['invalid_operation'])
  end

  result =  case operation
            when '1' then add(number1, number2)
            when '2' then subtract(number1, number2)
            when '3' then multiply(number1, number2)
            when '4' then divide(number1, number2)
            end
  
  prompt("#{MESSAGES['final_result']} #{result}")
  prompt(MESSAGES['futher_operations'])
  repeat = gets.chomp.upcase
  break unless repeat == 'Y'
end

puts "Goodbye"
