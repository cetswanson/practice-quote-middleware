require 'rack'
require 'rack/server'
require 'erb'

class Quote
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when "/quote" then  Rack::Response.new(render("quote.html.erb"))
    when "/update"
      Rack::Response.new do |response|
        response.redirect("/quote")
      end
    else Rack::Response.new("Not Found", 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
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