require 'rack'
require 'rack/server'

class Quote

  def initialize(app)
    @app = app
  end

end