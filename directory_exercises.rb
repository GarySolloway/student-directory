def input_students
  puts "Please enter the names of the students"
  # create an empty array
  students = []

  # while true, repeat this code
  while true do
    puts "Enter the student's name"
    # get name or set default
    name = gets.chomp
    name = "Student ##{students.count + 1}" if name.empty?

    puts "Enter the cohort"
    # get cohort or set default
    cohort = gets.chomp.to_sym
    cohort = "Unknown Cohort" if cohort.empty?

    puts "Enter the student's hobbies, separated by commas"
    # get hobbies or default
    hobbies = gets.chomp
    hobbies = "n/a" if hobbies.empty?

    puts "Enter the student's country of birth"
    # get country or set default
    country = gets.chomp
    country = "n/a" if country.empty?

    puts "Enter the student's height (ft in)"
    # get height or set default
    height = gets.chomp
    height = "n/a" if height.empty?

    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
    puts "Now we have #{students.count} students"

    puts "To continue, press enter or type 'exit' to quit."
    choice = gets.chomp

    break if choice == "exit"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(39)
  puts "--------------------------------".center(39)
end

def print(students)
  i = 0
  while i < students.length do
    puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]}) | Hobbies: #{students[i][:hobbies]} | Country of birth: #{students[i][:country]} | Height: #{students[i][:height]}"
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)