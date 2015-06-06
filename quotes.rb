require 'rack'
require 'rack/server'

class Quote
  def response
    [200, {}, 'Test']
  end
end