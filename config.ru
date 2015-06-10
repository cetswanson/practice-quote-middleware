require "./lib/quotes"

use Rack::Reloader, 0

run Quote.new