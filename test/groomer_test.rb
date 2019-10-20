require'minitest/autorun'
require'minitest/pride'
require'pry'
require'./lib/pet'
require'./lib/customer'
require'./lib/groomer'

class GroomerTest < MiniTest::Test

  def setup
    @groomer = Groomer.new({name: "Best Groomer", customers: []})
    @joel = Customer.new("Joel", 2)
    @mason = Customer.new("Mason", 5)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
    @spike = Pet.new({name: "Spike", type: :fish})
    @rex = Pet.new({name: "rex", type: :cat})
  end

  def test_it_exists
    assert_instance_of Groomer, @groomer
  end

  def test_it_can_initialize_name_and_customers
    assert_equal "Best Groomer", @groomer.name
    assert_equal [], @groomer.customers
  end

  def test_it_can_add_customers
    @groomer.add_customer(@joel)
    @groomer.add_customer(@mason)
    assert_equal [@joel, @mason], @groomer.customers
  end

  def test_it_can_find_customers_with_balance
    @groomer.add_customer(@joel)
    @groomer.add_customer(@mason)
    @mason.charge(25)
    assert_equal 25, @mason.outstanding_balance
    assert_equal [@mason], @groomer.customers_with_balance
  end

  def test_it_can_count_pet_types
    @groomer.add_customer(@joel)
    @groomer.add_customer(@mason)
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @mason.adopt(@rex)
    @mason.adopt(@spike)
    assert_equal 1, @groomer.number_of(:fish)
    assert_equal 2, @groomer.number_of(:cat)
    assert_equal 1, @groomer.number_of(:dog)
  end

end
