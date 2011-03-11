
class UserFinder 
  def self.authenticate_user( user_list, username, password )
    result = nil
    
    for user in user_list 
      if user.username == username 
        result = user
      end
    end
    
    if !result 
      raise UserFinderException, "Username not found"
    end

    if !user.password_equals?(password)
      raise UserFinderException, "Password doesn't match"
    end

    result
  end
end

class UserFinderException < StandardError
end

