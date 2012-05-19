require_relative '../geoapp'
require 'rack/test'
require 'json'
require 'cgi'

set :environment, :test

def app
  Sinatra::Application
end


describe 'Home page' do
  include Rack::Test::Methods
  before { get '/'}

  it "should load the home page" do
    last_response.should be_ok
  end

  it "should contain the map canvas" do
    last_response.body.should include("map_canvas")
  end
end

describe 'Geolocalization' do
  include Rack::Test::Methods

  let(:addr) { "Hernando de aguirre 201, Santiago, Chile"}
  let(:coord) {{
    "lat" => -33.4198636,
    "lng" => -70.6009387,
    "txt" => "Hernando de Aguirre 201, Providencia, Santiago Metropolitan Region, Chile",
    "status" => "ok"
    }.to_json}

  it "should geocode addresses" do
    get "/geocode", params = { :d => addr}
    last_response.body.should == coord
  end

end
