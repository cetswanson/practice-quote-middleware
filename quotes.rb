require 'rack'
require 'rack/server'

class Quote
  def response
    [200, {}, pick_random_line("rickygervais.txt")]
  end
end

def pick_random_line(file_name)
  chosen_line = nil
  File.foreach("fixtures/" + file_name).each_with_index do |line, number|
    chosen_line = line if rand < 1.0/(number+1)
  end
  return chosen_line
end

class QuotesApp
  def self.call(env)
    Quote.new.response
  end
end

Rack::Server.start :app => QuotesApp