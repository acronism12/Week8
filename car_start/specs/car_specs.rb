require_relative('../car_functions')
require_relative('../car_data')
require('minitest/autorun')

class CarTest < MiniTest::Test

  def setup
    @cars = CARS
  end

  def test_list_car_makes
    car_makes = list_car_makes(@cars)
    expected = ["Ford","Lotus","Vauxhall","Volkswagen"]
    assert_equal(expected, car_makes)
  end

  def test_list_by_make
    cars_by_make = list_by_make("Ford", @cars)
    expected = ["Fiesta","Focus"]
    assert_equal(expected, cars_by_make)
  end

  def test_search_by_price
    matching_cars = search_by_price("1000", "10000", @cars)
    expected = [
      {
        make: "Vauxhall", model: "Astra", mileage: 45000, year: 2008, price: 3500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      },

      {
        make: "Ford", model: "Fiesta", mileage: 25000, year: 2010, price: 4800,
        spec: {
          air_con: false,
          cruise_control: false
        }
      },

      { make: "Ford", model: "Focus", mileage: 35000, year: 2007, price: 5000,
        spec: {
          air_con: true,
          cruise_control: false
        }
      },

      {
        make: "Volkswagen", model: "Golf", mileage: 25000, year: 2009, price: 5500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      }
    ]
    assert_equal(expected,matching_cars)
  end

  def test_search_by_mileage
    matching_cars = search_by_mileage("50000", @cars)
    expected = [
      {
        make: "Ford", model: "Fiesta", mileage: 25000, year: 2010, price: 4800,
        spec: {
          air_con: false,
          cruise_control: false
        }
      },

      {
        make: "Volkswagen", model: "Golf", mileage: 25000, year: 2009, price: 5500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      },

      { make: "Ford", model: "Focus", mileage: 35000, year: 2007, price: 5000,
        spec: {
          air_con: true,
          cruise_control: false
        }
      },

      {
        make: "Vauxhall", model: "Astra", mileage: 45000, year: 2008, price: 3500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      }

    ]
    assert_equal(expected,matching_cars)
  end

  def test_search_by_year

    matching_cars = search_by_year("2007", "2010", @cars)
    expected = [{ make: "Ford", model: "Focus", mileage: 35000, year: 2007, price: 5000,
        spec: {
          air_con: true,
          cruise_control: false
        }
      },

      {
        make: "Vauxhall", model: "Astra", mileage: 45000, year: 2008, price: 3500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      },
      {
        make: "Volkswagen", model: "Golf", mileage: 25000, year: 2009, price: 5500,
        spec: {
          air_con: true,
          cruise_control: true
        }
      },
      {
        make: "Ford", model: "Fiesta", mileage: 25000, year: 2010, price: 4800,
        spec: {
          air_con: false,
          cruise_control: false
        }
      }


    ]
    assert_equal(expected,matching_cars)
  end


end
