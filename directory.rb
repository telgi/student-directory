def input_students
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice".center(100)
  # create an empty array
  students = []
  # get the first name
  loop do
    puts "Enter a name".center(100)
    name = gets.chomp
    puts "What is their main hobby?".center(100)
    hobby = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby}
    puts "Now we have #{students.count} students".center(100)
    puts "Do you wish to continue? 'Yes' or 'No'?".center(100)
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
  puts "The students of villains Academy".center(100)
  puts "______________".center(100)
end
def print(students)
  counter = 0
  while counter < students.length
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} | Cohort: #{student[:cohort]}) | Fave Hobby: #{student[:hobby]}".center(100)
      counter += 1
    end
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
