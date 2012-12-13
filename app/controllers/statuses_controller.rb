class StatusesController < ApplicationController
  def create
    x = HTTParty.get('http://www.mta.info/status/serviceStatus.txt')
    y = Hash.from_xml(x)
    lines = y["service"]["subway"]["line"]
    count = lines.size

    count.times do |num|
      line    = Line.find(num + 1)
      status  = lines[num]["status"]
      info    = lines[num]["text"]
      line.statuses.create(:condition => status, :info => info)
    end
  end
end