
class Comment

    attr_accessor :content, :user;
    
    def initialize ( content, author )
        @content = content;
        @author = author;
        @createdAt = Time.now;
    end    
    
end
