require 'digest'

class UserUtilities

  def self.encode_password( plain_password )
    return Digest::MD5.hexdigest( plain_password )
  end
end
