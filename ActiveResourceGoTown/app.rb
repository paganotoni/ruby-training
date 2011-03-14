require 'active_resource'
require 'sinatra'

class TownsConsumer < ActiveResource::Base
  self.site = "http://www.gotown.com/"
  self.element_name = "towns"
end

get "/" do
  @towns = TownsConsumer.find(:all)
  haml :list
end
