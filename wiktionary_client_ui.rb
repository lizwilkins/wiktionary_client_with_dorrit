require './ui_helper'

puts "Welcome!"
choice == nil
until choice == 'y'
  puts "Press ENTER to skip an option."

  print "Look up a word (y/n): "
  if gets.chomp == 'y'
    Entry.find('word' => gets.chomp)  # errors
  end

  print "List all words (y/n): "
  if gets.chomp == 'y'
    Entry.list  # errors
  end
  
  print "Delete a word (y/n): "
   if gets.chomp == 'y'
    Entry.new('id' => gets.chomp).delete
  end
 
  print "Update an entry (y/n): "
   if gets.chomp == 'y'
    puts "What word would you like to update?"
    modified_entry = Entry.find(gets.chomp)
    word = modified_entry.word
    definition = modified_entry.definition
    puts "Would you like to edit the word(w) or the definition (d)?"
    choice = gets.chomp
    case choice
    when 'w'
      puts 'what is the updated word for this entry?'
      word = gets.chomp
    when 'd'
      puts 'What is the updated definition for this entry?'
      definition = gets.chomp
    end
    modified_entry.update('word' => word, 'definition' => definition)  # errors
  end
 
  print "Enter a new word: "
  word = gets.chomp
  print "Enter a definition for #{word}: "
  definition = gets.chomp
  Entry.new('word' => word, 'definition' => definition)
  # puts "Here is your entry: "
  # print "#{new_entry.word}: #{new_entry.definition}"
  # print "Add to Wiktionary (y/n): "
  # if gets.chomp == 'y'
  #   new_entry.add  # errors
  # end
  puts "Do you want to exit (y/n): "
  choice = gets.chomp
end
  