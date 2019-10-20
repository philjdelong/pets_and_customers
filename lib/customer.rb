class Customer
  attr_reader :name, :id, :pets
  attr_accessor :outstanding_balance

  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balance = 0
  end

  def adopt(animal)
    @pets << animal
  end

  def charge(integer_amount)
    @outstanding_balance += integer_amount
  end
end
