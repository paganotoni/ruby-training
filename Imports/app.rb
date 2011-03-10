require "rubygems"
require "sinatra"
require "haml"

# This line to require files in a model folder
Dir["./model/*.rb"].each {|file| require "#{file}" }

get "/" do
   haml :ask;
end

get '/weather' do
  @weather = "sunny"
  @temperature = 80
  haml :weather
end

post "/feeling" do
  @feeling = params[ :feeling ]
  haml :feeling
end

