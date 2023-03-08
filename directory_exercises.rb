def input_students
  puts "Please enter the names of the students"
  # create an empty array
  students = []

  # while true, repeat this code
  while true do
    puts "Enter the student's name"
    # get name
    name = gets.gsub("\n","") # using gsub as an alternative to chomp

    puts "Enter the cohort"
    # get cohort
    cohort = gets.chomp.capitalize.to_sym

    puts "Enter the student's hobbies, separated by commas"
    # get hobbies
    hobbies = gets.chomp

    puts "Enter the student's country of birth"
    # get country
    country = gets.chomp

    puts "Enter the student's height (ft in)"
    # get height
    height = gets.chomp

    # only add the student if a name was provided
    if !name.empty?
      # add the student hash to the array
      students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
    end

    # display student count, singular/plural
    student_count = "Now we have #{students.count} student"
    student_count << "s" if students.count > 1
    puts student_count

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
  # check if any students
  if students.count == 0
    return puts "No students found".center(39)
  end

  # get list of cohorts
  cohorts = students.map { |cohort| cohort[:cohort] }.uniq
  # group students by cohort
  cohorts.each do |cohort|
    puts "#{cohort} cohort:"
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        puts "#{index + 1}. #{student[:name]} | Hobbies: #{student[:hobbies]} | Country of birth: #{student[:country]} | Height: #{student[:height]}"
      end
    end
  end
end

def print_footer(students)
  footer_text = "Overall, we have #{students.count} great student"
  footer_text << "s" if students.count > 1
  puts footer_text.center(40)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)