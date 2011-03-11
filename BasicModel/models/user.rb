

class User
  attr_accessor :username

  def initialize(type, username, password)
    @type = type;
    @username = username;
    @password = UserUtilities::encode_password( password );
  end

  def is_administrator?
    return @type == UserType::ADMINISTRATOR;
  end

  def is_salesman?
    return @type == UserType::SALESMAN;
  end

  def is_regular?
    return @type == UserType::REGULAR;
  end

  def password_equals?( plain_password )
    return UserUtilities::encode_password( plain_password ) == @password;
  end

end




