require_relative("./bank_data.rb")
require_relative("./bank_account_functions.rb") #don't strictly need .rb extension

puts "Welcome to CodeClan Bank"


while true
  puts "What would you like to do?"

  puts "Options:"
  puts "  q: Exit"
  puts "  1: Show account holders"
  puts "  2: Personal Bank Accounts"
  puts "  3: Business Bank Accounts"
  puts "  4: High Risk Accounts Holders"
  puts "  5: Find Account Details By Name"

  choice = gets.chomp
  if choice == "q"
    puts "See you later"
    break
  elsif choice == "1"
    puts "Account names: "
    puts bank_account_owner_names(ACCOUNTS)
  elsif choice == "2"
    puts "Personal Bank Accounts: "
    puts filter_accounts_by_type("personal", ACCOUNTS)
  elsif choice == "3"
    puts "Business Bank Accounts: "
    puts filter_accounts_by_type("business", ACCOUNTS)
  elsif choice == "4"
    puts "High Risk Account Holders: "
    puts find_accounts_by_risk("high", ACCOUNTS)
  elsif choice == "5"
    puts "Enter name to find: "
    name = gets.chomp
    if name.length == 0
      puts "Sorry, you have to type in a name!"
    else
      puts "Account details for #{name} is: "
      puts find_account_by_name(name, ACCOUNTS)
    end
  end
  puts
  puts
end
