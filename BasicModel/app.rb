require 'rubygems'
require 'sinatra'
require 'haml'
Dir[ './models/*.rb' ].each{ |model| require "#{ model }" }

enable :sessions
users = [ User.new( UserType::ADMINISTRATOR, "Administrator", "password")  ]

before "/secure/*" do
  if !session[:user]
    redirect "/login"
  end
end

get '/' do
  haml :index
end

get '/login' do
  haml :login
end

post '/authenticate' do
  user = nil ;
  username = params[:username]
  password = params[:password]

  begin 
    user = UserFinder::authenticate_user( users, username, password )
  rescue => e
    p e.message
  end

  if user == nil
    session[:user] = nil
    redirect "/login"
  else
    session[:user] = user 
    if session[:route]
      redirect session[:route]
    else
      redirect '/secure/index'
    end
  end

end

get '/secure/index' do
  haml :"/secure/secure_index"
end
