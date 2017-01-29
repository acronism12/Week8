require_relative( './animal_functions.rb' )
require_relative( './animal_data.rb' )

puts "Animals are nice";
while true
  puts "What would you like to do";
  puts "Options:"
  puts "  q: Exit"
  puts "  1: Show animals"
  puts "  2: List animals alphabetically"
  puts "  3: Total weight of all animals"
  puts "  4: List animals by weight"
  puts "  5: Search for animal by name"

  choice = gets.chomp()
  if choice == "q"
    puts "See you later"
    break
  elsif choice == "1"
    puts "Animal names:"
    puts get_animal_names(ANIMALS)

  elsif choice == "2"
    puts "Animal names sorted:"
    puts get_animal_names_sorted(ANIMALS)

  elsif choice == "3"
    puts "Total weight of all animals:"
    puts get_total_weight(ANIMALS).to_s + "kg"

  elsif choice == "4"
    puts "Animals by weight:"
    animals = get_animal_names_by_weight(ANIMALS)
    for animal in animals
      longest_key = animal.keys.max_by(&:length)
      #puts longest_key
      #printf "%-#{longest_key.length}s %s\n", animal["name"] + "\t", animal["weight"].to_s + "kg"
      print animal["name"].ljust(20)
      puts animal["weight"].to_s.rjust(20) + "kg"
    end
    #printf "%-#{longest_key.length}s %s\n", "Total" + "\t", get_total_weight(ANIMALS).to_s + "kg"
    print "Total Weight".ljust(20)
    puts get_total_weight(ANIMALS).to_s.rjust(20) + "kg"

  elsif choice == "5"
    print "Enter animal to search for: "
    name = gets.chomp
    puts find_animal_by_name(name, ANIMALS)

  end

  puts "\n\n"
end
