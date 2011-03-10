require 'rubygems'
require 'sinatra'
require 'haml'
require 'singleton'
require 'json'

Dir["./model/*.rb"].each{ |it| require "#{it}" }



get '/' do
    p Storage.instance
    haml :index
end

get '/post' do
    p Storage.instance
    haml :postUpdate
end

post '/saveUpdate' do
    storage = Storage.instance
    
    username = params[:username]
    exists = storage.user_exists?( username )
    user = nil;
    if exists 
        
    else
       total = storage.users.length
       user = User.new( total+1 , username, username, username )
       storage.add_user( user )
    end
    
    comment = Comment.new( params[ :comment ], user )
    storage.add_comment( comment )
    redirect '/'
end

get '/comments' do
    storage = Storage.instance
    @comments = storage.comments
    haml :comments
end

get "/json" do
    { :a => '0', :b => '1'}.to_json
end


