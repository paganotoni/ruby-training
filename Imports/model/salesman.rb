
class Salesman < Person
  attr_accessor :name, :phone
  
  def initialize( identification , name, phone )
    super( identification )
    @name = name;
    @phone = phone;
  end
  
end
