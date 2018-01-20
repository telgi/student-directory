def input_students
  puts "Welcome to the Student Directory of Villains Academy. Time to add some new recruits!"
  students = []
  loop do
    puts "Enter a name"
    name = gets.chomp
    puts "What is their cohort?"
    cohort = gets.chomp
    if cohort == ""
      cohort = :January
    end
    puts "What is their main hobby?"
    hobby = gets.chomp
    puts "Name: #{name.to_sym} | Cohort: #{cohort.to_sym} | Hobby: #{hobby.to_sym}"
    puts "Is all the information correct? 'Yes' or 'No'?"
    correct = gets.chomp
    if correct == 'Yes'
      students << {name: name.to_sym, cohort: cohort.to_sym, hobby: hobby.to_sym}
      puts "Now we have #{students.count} students"
      puts "Do you wish to continue? 'Yes' or 'No'?"
      continue = gets.chomp
      if continue == 'Yes'
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
  counter = 0
  while counter < students.length
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} | Cohort: #{student[:cohort]} | Fave Hobby: #{student[:hobby]}"
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
