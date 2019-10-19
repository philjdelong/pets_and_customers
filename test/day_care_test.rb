require'minitest/autorun'
require'minitest/pride'
require'pry'
require'./lib/pet'
require'./lib/customer'
require'./lib/day_care'

class Day_careTest <Minitest::Test
  def setup
    @day_care_1 = Day_care.new({:name => "Day Care 1", :id => 1, :customers => []})
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
  end

  def test_it_exists
    assert_instance_of Day_care, @day_care_1
  end

  def test_it_initializes
    assert_equal "Day Care 1", @day_care_1.name
    assert_equal 1, @day_care_1.id
    assert_equal [], @day_care_1.customers
  end

  def test_it_can_add_customers
    assert_equal [], @day_care_1.customers
    @day_care_1.add_customer(@joel)
    assert_equal [@joel], @day_care_1.customers
  end

  def test_it_can_identify_customers_by_id
    @day_care_1.add_customer(@joel)
    assert_equal @joel, @day_care_1.customer_by_id(2)
  end
end
