@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # get the first name
  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    cohort = "november"
    add_student(name, cohort)
    puts "Student added!"
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    menu_options(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save to CSV file"
  puts "4. Load from CSV file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def menu_options(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    abort("Bye!") # quits the program
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # ask the user to name the file
  puts "Enter a name for the file"
  filename = STDIN.gets.chomp + ".csv"
  # open the file for writing
  file = File.open(filename, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Data saved successfully to '#{filename}'"
end

def load_students(filename = nil)
  # ask the user for a file to load
  if filename == nil # if the user chose option 4, (load_students called without parameter)
    puts "Enter a CSV file to load"
    filename = STDIN.gets.chomp
  end

  if File.exists?(filename) # if file exists
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student(name, cohort)
    end
    file.close
    puts "The data was loaded!, choose option 2 to display it."
  else # if file doesn't exist
    puts "Sorry, #{filename} doesn't exist."
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # exit method if not provided
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# adds a new student to the array
def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu