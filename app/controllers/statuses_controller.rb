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

        users_to_text = line.users #returns an array of users who are tracking that line
        number_to_text = users_to_text.size #returns the number of users in the array to text

        number_to_text.times do |x|
          phone_number = users_to_text[x].phone
          client = Twilio::REST::Client.new(TW_SID, TW_TOK)

          if line.statuses[0].condition == "DELAYS"
            status_update = line.statuses[0].info.split(/\n/)[5].strip.gsub('<STRONG>', '').gsub('</STRONG>', '') #parses the MTA data to give only the status update.
            client.account.sms.messages.create({:from => '+19177463330', :to => phone_number, :body => "Aw snap! #{status_update}"})
          elsif line.statuses[0].condition == "GOOD SERVICE"
            client.account.sms.messages.create({:from => '+19177463330', :to => phone_number, :body => "Woo woo! The #{line.line} line is running as normal."})
          end
        end
      end
    end
    redirect_to root_path
  end
end