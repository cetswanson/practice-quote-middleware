require 'rack'
require 'rack/server'

class Quote

  def call(env)
    [200, {"Content-Type" => "text/plain"}, [pick_random_line("rickygervais.txt")]]
  end

  def pick_random_line(file_name)
    chosen_line = nil
    File.foreach("fixtures/" + file_name).each_with_index do |line, number|
      chosen_line = line if rand < 1.0/(number+1)
    end
    return chosen_line
  end

end