
class User
  attr_accessor :id, :username
  def initialize( id, username )
    @id = id
    @username = username
  end

end

users = [ User.new( 1, "user_1"), User.new( 2, "user_2" ) ]
p users.to_s.to_xml

