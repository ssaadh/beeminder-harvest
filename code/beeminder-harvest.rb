# Own code to push Harvest to Beeminder

require_relative 'beeminder'
require_relative 'harvest'

date = yesterday

harvest_clients = file_contents "#{File.dirname(__FILE__)}/data/harvest.txt"
beeminder_goals = file_contents "#{File.dirname(__FILE__)}/data/beeminder.txt"

total = total_time( date )
total = total - client_time( harvest_clients.last, date )

update_beeminder_goal( beeminder_goals.first, total, date )
puts "done #{beeminder_goals.first}"
beeminder_goals.shift

count = harvest_clients.count - 1
for i in 0..count
  harvest_time = client_time( harvest_clients[ i ], date )
  update_beeminder_goal( beeminder_goals[ i ], harvest_time, date )
  puts "done #{beeminder_goals[ i ]}"
end
