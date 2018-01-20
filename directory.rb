def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students(students)
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean - please try again..."
    end
  end
end

def input_students(students)
  puts "Welcome to the Student Directory of Villains Academy. Time to add some new recruits!"
  students_string = "students"
  loop do
    puts "Enter a name"
    name = gets.strip
    while name == ""
      puts "You must enter a name"
      name = gets.chomp
    end
    puts "What is their cohort?"
    cohort = gets.strip
    if cohort == ""
      cohort = :January
    end
    puts "What is their main hobby?"
    hobby = gets.chomp
    puts "Name: #{name.to_sym} | Cohort: #{cohort.to_sym} | Hobby: #{hobby.to_sym}"
    puts "Is all the information correct? 'y' or 'n'?"
    correct = gets.strip.downcase
    if correct == 'y'
      students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym}
      if students.count == 1
        students_string = "student"
      end
      puts "Now we have #{students.count} #{students_string}"
      puts "Do you wish to continue? 'y' or 'n'?"
      continue = gets.strip.downcase
      if continue == 'y'
        next
      else
        break
      end
    else
      next
    end
  end
  students
end
def print_header
  puts "The students of villains Academy"
  puts "______________"
end

def print(students)
  puts "What cohort would you like to see?"
  cohort_display = gets.strip.to_sym
  students.each_with_index do |student, index|
    if cohort_display == student[:cohort]
      puts "#{index + 1}. #{student[:name]} | Hobby: #{student[:hobby]}"
    end
  end
end

def print_footer(students)
  students_string = "students"
  if students.count == 1
    students_string = "student"
  end
  puts "Overall, we have #{students.count} great #{students_string}"
end

interactive_menu
