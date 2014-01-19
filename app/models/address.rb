class Address
  attr_reader :city, :street

  def initialize(city, street, description)
    @city = city
    @street = street
    @description = description
  end

  def to_s
    address = "#{city}"
    address << ", #{street}" if street.present?

    address
  end
end
