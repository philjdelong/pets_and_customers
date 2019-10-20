class Groomer
  attr_reader :name, :customers

  def initialize(groomer_info)
    @name = groomer_info[:name]
    @customers = []
  end

  def add_customer(customer_info)
    @customers << customer_info
  end

  def customers_with_balance
    with_balance = @customers.find_all do |customer|
      customer.outstanding_balance > 0
    end
    with_balance
  end

  def number_of(type)
    pets = @customers.map do |customer|
      customer.pets
    end
    #you need to set pets EQUAL to pets.flatten, otherwise we're not altering the original array
    pets = pets.flatten
    pets.count do |pet|
      pet.type == type
    end
  end

end
