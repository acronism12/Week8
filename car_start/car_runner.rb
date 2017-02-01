require_relative( './car_functions.rb' )
require_relative( './car_data.rb' )

puts "Welcome to car trader";
while true
  puts "What would you like to do";
  puts "Options:"
  puts "  q: Exit"
  puts "  1: Show all makes for sale"
  puts "  2: List cars by make"
  puts "  3: Search all cars by price range"
  puts "  4: Search all cars by mileage"
  puts "  5: Search all cars by year"

  choice = gets.chomp()
  if choice == "q"
    puts "See you later"
    break
  elsif choice == "1"
    puts "Car makes:"
    puts list_car_makes(CARS)

  elsif choice == "2"
    puts "Enter make to search for:"
    make = gets.chomp
    puts "Available models:"
    puts list_by_make(make, CARS)

  elsif choice == "3"
    print "Enter minimum price:"
    lower = gets.chomp
    print "Enter maximum price:"
    upper = gets.chomp
    puts "Matching cars (price sorted low to high):"
    puts search_by_price(lower, upper, CARS)

  elsif choice == "4"
    print "Enter maximum mileage:"
    upper = gets.chomp
    puts "Matching cars (mileage sorted low to high):"
    puts search_by_mileage(upper, CARS)

  elsif choice == "5"
    print "Enter oldest year:"
    lower = gets.chomp
    print "Enter newest year:"
    upper = gets.chomp
    puts "Matching cars (year sorted older to newer):"
    puts search_by_year(lower, upper, CARS)

  end

  puts "\n\n"
end
