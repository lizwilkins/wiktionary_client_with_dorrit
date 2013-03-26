require './ui_helper'

puts "\n\nWelcome!"
choice = nil
until choice == 'x'
  puts "\nWhat would you like to do?"
  puts "'f' to look up a word"
  puts "'l' to list all words"
  puts "'d' to delete a word"
  puts "'a' to add a word"
  puts "'u' to update a word"
  puts "'x' to exit"

  case choice = gets.chomp
  when 'f'
      print "Enter a word: "
      entries = Entry.find('word' => gets.chomp)  # errors
      entries.each {|entry| puts "#{entry.word}:  #{entry.definition}"}  # errors

  when 'l'
      entries = Entry.list
      puts "ID  Word       Definition"
      entries.each {|entry| puts "#{entry.id}  #{entry.word}:  #{entry.definition}"}  # errors
  
  when 'd'
    entries = Entry.list
      puts "ID  Word       Definition"
      entries.each {|entry| puts "#{entry.id}  #{entry.word}:  #{entry.definition}"}
      print "What word would you like to delete(enter ID):  "
      Entry.find(gets.chomp)
      print "Are you sure you want to delete '#{entry.word}' (y/n)?"
      if gets.chomp == 'y'
        Entry.new('id' => gets.chomp).delete
      end

   when 'u'  
      entries = Entry.list
      puts "ID  Word       Definition"
      entries.each {|entry| puts "#{entry.id}  #{entry.word}:  #{entry.definition}"}
      print "What word would you like to update(enter word):  "
      entry = Entry.find(gets.chomp)
      word = entry.word
      definition = entry.definition
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
      print "Are you sure you want to update '#{entry.word}' (y/n)?"
      if gets.chomp == 'y'
        #modified_entry = Entry.new('id' => entry.id, 'word' => word, 'definition' => definition)  # errors
        entry.update('id' => entry.id, 'word' => word, 'definition' => definition)
      end

    when 'a'
      print "Enter a new word: "
      word = gets.chomp
      print "Enter a definition for #{word}: "
      definition = gets.chomp
      Entry.create('word' => word, 'definition' => definition)
      # puts "Here is your entry: "
      # print "#{new_entry.word}: #{new_entry.definition}"
      # print "Add to Wiktionary (y/n): "
      # if gets.chomp == 'y'
      #   new_entry.add  # errors
      # end
    when 'x'
      break
    end
end
  