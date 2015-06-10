require 'rack'
require 'rack/server'

class Quote

  def initialize(app)
    @app = app
  end

  def call(env)
    [status, headers, response]
  end

  def response
    [200, {"Content-Type" => "text/plain"}, pick_random_line("rickygervais.txt")]
  end

end