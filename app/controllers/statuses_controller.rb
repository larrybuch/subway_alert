class StatusesController < ApplicationController
  def create
    x = HTTParty.get('http://larrybuch.com/mta.txt')
    y = Hash.from_xml(x)
    lines = y["service"]["subway"]["line"]
    count = lines.size

    count.times do |num|
      line       = Line.find(num + 1)
      condition  = lines[num]["status"]
      info       = lines[num]["text"]
      if condition != line.statuses[0].condition
        line.statuses[0].update_attributes(:condition => condition, :info => info)
        if line.statuses[0].condition = "DELAYS"
          puts "Delays!"
        elsif line.statuses[0].condition = "GOOD SERVICE"
          puts "Good Service!"
        end
      end
    end

    redirect_to root_path
  end
end