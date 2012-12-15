namespace :line_condition do
  desc "get current subway status"
  task :getcondition => :environment do
    x = HTTParty.get('http://www.mta.info/status/serviceStatus.txt')
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

        if line.statuses[0].condition == "DELAYS"
          number_to_text.times do |num|
            phone_number = users_to_text[num].phone
            puts phone_number
            #client = Twilio::REST::Client.new(TW_SID, TW_TOK)
            #status_update = line.statuses[0].info.split(/\n/)[5].strip.gsub('<STRONG>', '').gsub('</STRONG>', '') #parses the MTA data to give only the status update.
            #@message = client.account.sms.messages.create({:from => '+19177463330', :to => phone_number, :body => "Aw Snap! #{status_update}"})
          end

        elsif line.statuses[0].condition == "GOOD SERVICE"
          number_to_text.times do |num|
            phone_number = users_to_text[num].phone
            puts phone_number
            #client = Twilio::REST::Client.new(TW_SID, TW_TOK)
            #@message = client.account.sms.messages.create({:from => '+19177463330', :to => phone_number, :body => "Woo woo! The #{line.line} is back up."})
          end
        end
      end
    end
  end
end