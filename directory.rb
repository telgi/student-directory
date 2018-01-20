def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  loop do
    puts "Enter a name"
    name = gets.chomp
    puts "What is their main hobby?"
    hobby = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students"
    puts "Do you wish to continue? 'Yes' or 'No'?"
    continue = gets.chomp
    if continue == 'Yes'
      next
    else
      break
    end
  end
  students
end
def print_header
  puts "The students of villains Academy"
  puts "______________"
end
def print(students)
  counter = 0
  while counter < students.length
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} | Cohort: #{student[:cohort]}) | Fave Hobby: #{student[:hobby]}".center(30)
      counter += 1
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
