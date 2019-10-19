class Pet
  attr_reader :name, :type
  attr_accessor :fed

  def initialize(pet_info)
    @name = pet_info[:name]
    @type = pet_info[:type]
    @fed = false
  end

  def fed?
    @fed
  end

  def feed
    @fed = true
  end

end
