require 'rubygems'
require 'sinatra'

get '/nombres' do
  @name = "usuario"
  haml :index
end


