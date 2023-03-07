def input_students
  # create an empty array
  students = []

  # while true, repeat this code
  while true do
    puts "Enter your name"
    # get name
    name = gets.chomp

    puts "Enter your hobbies, separated by commas"
    # get hobbies
    hobbies = gets.chomp

    puts "Enter your country of birth"
    # get country
    country = gets.chomp

    puts "Enter your height (ft in)"
    # get height
    height = gets.chomp

    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
    puts "Now we have #{students.count} students"

    puts "To continue, press enter or type 'exit' to quit."
    choice = gets.chomp

    break if choice == "exit"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]}) | Hobbies: #{students[i][:hobbies]} | Country of birth: #{students[i][:country]} | Height: #{students[i][:height]}"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)