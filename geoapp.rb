require 'rubygems'
require 'sinatra'
require 'coffee_script'
require 'open-uri'
require 'cgi'
require 'json'

GCURL = 'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address='

get '/' do
  erb :geoapp
end

get '/geocode' do
  content_type :json

  c = open(GCURL + CGI::escape(params[:d])).read
  r = JSON.parse(c)
  coord = r['results'][0]['geometry']['location']
  coord.to_json
end
