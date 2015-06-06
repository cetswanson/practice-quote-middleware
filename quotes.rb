require 'rack'
require 'rack/server'

class Quote
  def response
    [200, {}, 'Test']
  end
end

class QuotesApp
  def self.call(env)
    Quote.new.response
  end
end