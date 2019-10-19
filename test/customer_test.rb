require'minitest/autorun'
require'minitest/pride'
require'pry'
require'./lib/pet'
require'./lib/customer'

class CustomerTest < Minitest::Test
  def setup
    @joel = Customer.new("Joel", 2)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
  end

  def test_it_exists
    assert_instance_of Customer, @joel
  end

  def test_it_initializes
    assert_equal "Joel", @joel.name
    assert_equal 2, @joel.id
  end

  def test_it_has_pets_array
    assert_equal [], @joel.pets
  end

  def test_it_can_adopt_pets
    assert_equal [], @joel.pets
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    assert_equal [@samson, @lucy], @joel.pets
  end

  def test_it_has_an_outstanding_balance
    assert_equal 0, @joel.outstanding_balance
  end

  def test_it_can_be_charged
    assert_equal 0, @joel.outstanding_balance
    @joel.charge(15)
    @joel.charge(7)
    assert_equal 22, @joel.outstanding_balance
  end

end
