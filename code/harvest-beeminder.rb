# Own code to push Harvest to Beeminder

require_relative 'harvest'

date = yesterday

harvest_clients = file_contents( './harvest.txt' )
beeminder_goals = file_contents( './beeminder.txt' )

total = total_time( date )
update_beeminder_goal( beeminder_goals[ 0 ], total, date )
beeminder_goals.shift

for i in 0..harvest_clients.count
  harvest_time = client_time( harvest_clients[ 0 ], date )
  update_beeminder_goal( beeminder_goals[ i ], harvest_time , date )
end
