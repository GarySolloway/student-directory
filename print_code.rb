# this file reads it's own source code and prints it on the screen
puts File.read(__FILE__)

def welcome
  puts "Hello world!"
  puts "I'm reading my own source code!"
  puts "Goodbye!"
end