require'minitest/autorun'
require'minitest/pride'
require'pry'
require'./lib/pet'

class PetTest < Minitest::Test

  def setup
    @samson = Pet.new({name: "Samson", type: :dog})
  end

  def test_it_exists
    # skip
    assert_instance_of Pet, @samson
  end

  def test_it_has_a_name
    assert_equal "Samson", @samson.name
  end

  def test_it_has_a_type
    assert_equal :dog, @samson.type
  end

  def test_it_can_be_fed
    assert_equal false, @samson.fed?
    @samson.feed
    assert_equal true, @samson.fed?
  end


end
