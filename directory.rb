@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have selected '1'. Time to add some new recruits!"
    input_students
  when "2"
    puts "You have selected '2'. Let's see who's signed up!"
    show_students
  when "3"
    puts "You have selected '3'. All new recruits have now been saved!"
    save_students
  when "4"
    puts "You have selected '4'. All current recruits have now been loaded!"
    load_students
  when "9"
    puts "You have selected '9'. Bye! See you when you have some new recruits!"
    exit
  else
    puts "I don't know what you mean - please try again..."
  end
end

def input_students
  students_string = "students"
  loop do
    puts "Enter a name"
    name = STDIN.gets.strip
    while name == ""
      puts "You must enter a name"
      name = STDIN.gets.chomp
    end
    puts "What is their cohort?"
    cohort = STDIN.gets.strip
    if cohort == ""
      cohort = :January
    end
    puts "What is their main hobby?"
    hobby = STDIN.gets.chomp
    puts "Name: #{name.to_sym} | Cohort: #{cohort.to_sym} | Hobby: #{hobby.to_sym}"
    puts "Is all the information correct? 'y' or 'n'?"
    correct = STDIN.gets.strip.downcase
    if correct == 'y'
      add_students(name, cohort, hobby)
      if @students.count == 1
        students_string = "student"
      end
      puts "Now we have #{@students.count} #{students_string}"
      puts "Do you wish to continue? 'y' or 'n'?"
      continue = STDIN.gets.strip.downcase
      if continue == 'y'
        next
      else
        break
      end
    else
      next
    end
  end
end

def add_students(name, cohort, hobby)
  @students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  puts "What cohort would you like to see?"
  cohort_display = STDIN.gets.strip.to_sym
  @students.each_with_index do |student, index|
    if cohort_display == student[:cohort]
      puts "#{index + 1}. #{student[:name]} | Hobby: #{student[:hobby]}"
    end
  end
end

def print_footer
  students_string = "students"
  if @students.count == 1
    students_string = "student"
  end
  puts "Overall, we have #{@students.count} great #{students_string}"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, hobby = line.chomp.split(',')
    add_students(name, cohort, hobby)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
