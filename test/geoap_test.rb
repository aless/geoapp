require_relative '../geoapp'
require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_homepage
    get '/'
    assert last_response.ok?
    assert last_response.body.include? "map_canvas"
  end

  def test_geocoding
    addr = "Hernando de aguirre 201, Santiago, Chile"
    coord = {
      "lat" => -33.4198636,
      "lng" => -70.6009387,
      "txt" => "Hernando de Aguirre 201, Providencia, Santiago Metropolitan Region, Chile"
    }

    get "/geocode?d=" + CGI::escape(addr)
    assert JSON.parse(last_response.body) == coord
  end

end
