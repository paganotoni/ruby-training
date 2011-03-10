
class User < Person
    attr_accessor :email, :username, :comments;

    def initialize( id, name, email, username )
        super( id, name )
        @email = email;
        @username = username;
        @comments = [ ];
        @follows = [ ];
    end
    
    def follow( user ) 
        @follows.push( user ) 
    end
    
    def add_comment( comment )
        @comments.push( comment )
    end
    
end
