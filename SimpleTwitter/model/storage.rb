
require 'singleton'

class Storage
    include Singleton
    attr_accessor :comments, :users
    
    
    def initialize( )
        @comments = []
        @users = []
    end
    
    
    def user_exists?( username )
        result = false;
        @users.each{ |user| 
            if user.username == username
                result = true;
            end 
        }
        return result;
    end
    
    def add_user( user )
        @users = @users.push( user )
    end
    
    def add_comment( comment )
        @comments = @comments.push( comment )
    end
    
end
