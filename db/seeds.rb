Line.all.each do |line|
  Status.create(:line_id => line.id, :condition => 'GOOD SERVICE', :info => 'Service is good.' )
end