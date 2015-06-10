require 'rack'
require 'rack/server'

class Quote

  def initialize
    @app = Rack::Builder.new
  end

  def call(env)
    case env["REQUEST_PATH"]
    when "/quote"
      [200, {"Content-Type" => "text/plain"}, [pick_random_line("rickygervais.txt")]]
    else Rack::Response.new("Not Found", 404)
    end
  end

  def pick_random_line(file_name)
    chosen_line = nil
    File.foreach("fixtures/" + file_name).each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end

end