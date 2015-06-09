require 'rack'
require 'rack/server'
require 'erb'

class Quote
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when "/quote" then  Rack::Response.new(render("quote.html.erb"))
    else Rack::Response.new("Not Found", 404)
    end
  end

  private

  def pick_random_line(file_name)
    chosen_line = nil
    File.foreach("fixtures/" + file_name).each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end
end