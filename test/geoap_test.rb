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

  def test_js
    get '/geoapp.js'
    assert last_response.ok?
    assert last_response.headers["Content-Type"].include? "text/javascript"
  end

end
