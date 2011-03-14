require 'sinatra'

get "/:what" do
  "#{ params[:what] }"
end

