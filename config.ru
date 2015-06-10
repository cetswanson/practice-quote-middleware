require_relative "./lib/quotes"

use Rack::Reloader, 0

run Quote.new