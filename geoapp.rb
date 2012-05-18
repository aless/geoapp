require 'rubygems'
require 'sinatra'
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
  coord['txt'] = r['results'][0]['formatted_address']
  coord.to_json
end
