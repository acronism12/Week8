def list_car_makes(cars)
  makes = Array.new
  for car in cars
    makes.push(car[:make]).sort!.uniq!
  end
  return makes
end

def list_by_make(make, cars)
  car_list = Array.new
  for car in cars
    car_list.push(car[:model]).sort!.uniq! if car[:make].downcase == make.downcase
  end
  return car_list
end

def search_by_price(lower, upper, cars)
  search_result = Array.new
  if lower.nil? || lower.length == 0
    lower = 0
  end
  if upper.nil? || upper.length == 0
    upper = 1000000
  end
  for car in cars
    search_result.push(car).sort_by! { |k| k[:price]} if car[:price] <= upper.to_i && car[:price] >= lower.to_i
  end
  if search_result.any?
    return search_result
  else
    return "No matching cars!"
  end
end

def search_by_mileage(upper, cars)
  search_result = Array.new
  if upper.nil? || upper.length == 0
    upper = 1000000
  end
  for car in cars
    search_result.push(car).sort_by! { |k| k[:mileage]} if car[:mileage] <= upper.to_i
  end
  if search_result.any?
    return search_result
  else
    return "No matching cars!"
  end
end

def search_by_year(lower, upper, cars)
  search_result = Array.new
  if lower.nil? || lower.length == 0
    lower = 0000
  end
  if upper.nil? || upper.length == 0
    upper = 10000
  end
  for car in cars
    search_result.push(car).sort_by! { |k| k[:year]} if car[:year] >= lower.to_i && car[:year] <= upper.to_i
  end
  if search_result.any?
    return search_result
  else
    return "No matching cars!"
  end
end
