def number_of_bank_accounts(accounts)
  return accounts.length
end

def first_bank_account_holder(accounts)
  return accounts.first[:holder_name]
end

def bank_account_owner_names(accounts)
  names = []
  for account in accounts
    names << account[:holder_name]
  end
  return names
end

def filter_accounts_by_type(type, accounts)
  filtered_accounts = []
  for account in accounts
    filtered_accounts.push(account) if account[:type] == type
  end
  return filtered_accounts
end

def find_accounts_by_risk(risk_level, accounts)
  risky_accounts = []
  for account in accounts
    risk = account[:stats][:risk_level]
    risky_accounts << account if (risk == risk_level)
  end

  return bank_account_owner_names(risky_accounts)
end

def accounts_by_type(type=nil, accounts)
  if type
    filtered_accounts = filter_accounts_by_type(type, accounts)
  else
    filtered_accounts = accounts
  end

  return filtered_accounts
end

def total_cash_in_bank(type=nil, accounts)
  accounts_by_type = accounts_by_type(type, accounts)
  sum = 0
  for account in accounts_by_type
    sum += account[:amount]
  end
  return sum
end

def average_bank_account_value(accounts)
  return total_cash_in_bank(accounts) / number_of_bank_accounts(accounts)
end

def largest_bank_account_holder(type = nil, accounts)
  largest = largest_bank_account(type, accounts)
  return largest[:holder_name]
end

def largest_bank_account(type = nil, accounts)
  filtered_accounts = accounts_by_type(type, accounts)
  largest_account = filtered_accounts.first

  for account in filtered_accounts
    largest_account = account if account[:amount] > largest_account[:amount]
  end

  return largest_account
end

def find_account_by_name(name, accounts)
  named_account=[]
  for account in accounts
    if account[:holder_name].downcase == name.downcase  #downcase for case sensitivity
      named_account.push(account)
    #else
    #  named_account = "User not found!"
    end
  end
  return named_account
end
