class Day_care
  attr_reader :name, :id
  attr_accessor :customers

  def initialize(day_care_info)
    @name = day_care_info[:name]
    @id = day_care_info[:id]
    @customers = day_care_info[:customers]
  end

  def add_customer(customer_info)
    @customers << customer_info
  end

  def customer_by_id(id_number)
    @customers.each do |customer|
      if customer.id == id_number
        return customer
      else
        return "No dice!"
      end
    end
  end

end
