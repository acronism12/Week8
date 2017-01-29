require_relative('../animal_functions')
require_relative('../animal_data')
require('minitest/autorun')

class AnimalTest < MiniTest::Test

  def setup
    @animals = ANIMALS
  end

  def test_animal_names
    animal_names = get_animal_names(@animals)
    expected = ["Polar Bear","Elephant Seal","Blue Whale","Elephant"]
    assert_equal(expected, animal_names)
  end

  def test_animal_names_sorted
    animal_names_sorted = get_animal_names_sorted(@animals)
    expected = ["Blue Whale","Elephant","Elephant Seal","Polar Bear"]
    assert_equal(expected, animal_names_sorted)
  end

  def test_animals_by_weight
    animals_by_weight = get_animal_names_by_weight(@animals)
    #expected = [{Name: "Polar Bear",Weight: 500},{Name: "Elephant Seal",Weight: 4000},{Name: "Elephant",Weight: 6000},{Name: "Blue Whale",Weight: 140000}]
    expected = [
      { "name" => "Polar Bear", "weight" => 500, "carnivore" => true, "habitat" => "land" },
      { "name" => "Elephant Seal", "weight" => 4000, "carnivore" => true, "habitat" => "sea" },
      { "name" => "Elephant", "weight" => 6000, "carnivore" => false, "habitat" => "land" },
      { "name" => "Blue Whale", "weight" => 140000, "carnivore" => false, "habitat" => "sea" },
    ]
    assert_equal(expected,animals_by_weight)
  end

  def test_total_weight
    total_weight = get_total_weight(@animals)
    assert_equal(150500, total_weight)
  end

  def test_find_animal_by_name
    named_animal = find_animal_by_name("Polar Bear", @animals)
    assert_equal([{ "name" => "Polar Bear", "weight" => 500, "carnivore" => true, "habitat" => "land" }],named_animal)
  end
end
