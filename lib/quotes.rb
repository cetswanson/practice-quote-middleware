require 'rack'
require 'rack/server'

class Quote

  def initialize(app)
    @app = app
  end

  def call(env)
    [status, headers, response]
  end
end