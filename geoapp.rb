require 'rubygems'
require 'sinatra'
require 'coffee_script'

get '/' do
  erb :geoapp
end

get "/geoapp.js" do
  content_type "text/javascript"
  coffee :map
end
