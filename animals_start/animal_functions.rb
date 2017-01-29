def get_animal_names(animals)
  names = []
  for animal in animals
    names.push(animal["name"])
  end
  return names
end

def get_animal_names_sorted(animals)
  return get_animal_names(animals).sort
end

# def get_animal_names_by_weight(animals)
#   names_and_weight = Array.new
#   for animal in animals
#     name = animal["name"]
#     weight = animal["weight"]
#     hash = {Name: name, Weight: weight}
#     names_and_weight.push(hash)
#     names_and_weight.sort_by! { |k| k[:Weight]}
#   end
#   return names_and_weight
# end

def get_animal_names_by_weight(animals)
  names_and_weight = Array.new
  names_and_weight = animals.sort_by { |k| k["weight"]}
  return names_and_weight
end

def get_total_weight(animals)
  total_weight = 0
  for animal in animals
    total_weight += animal["weight"]
  end
  return total_weight
end

def find_animal_by_name(name, animals)
  named_animal = Array.new
  for animal in animals
    if animal["name"].downcase == name.downcase
      named_animal.push(animal)
    end
  end
  if named_animal.any?
    return named_animal
  else
    return "Not Found!"
  end
end
