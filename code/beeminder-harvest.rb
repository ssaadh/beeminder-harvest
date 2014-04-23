# Code to push Harvest to Beeminder

require_relative 'beeminder'
require_relative 'harvest'

date = yesterday

harvest_clients = file_contents "#{File.dirname(__FILE__)}/data/harvest.txt"
beeminder_goals = file_contents "#{File.dirname(__FILE__)}/data/beeminder.txt"

puts "date: #{date}"

## total all time.
# this includes all times for the Harvest clients listed in harvest.txt. 
total = total_time( date )

update_beeminder_goal( beeminder_goals.first, total, date )
puts "done #{beeminder_goals.first}"
# remove this goal from the array as it is done
beeminder_goals.shift

## total own-ish time
# this is also an aggregation time, but does not include the last listed Harvest client time from harvest.txt.
# So this total is for all of the harvest.txt client times except the last one.
total_own = total - client_time( harvest_clients.last, date )

update_beeminder_goal( beeminder_goals.first, total_own, date )
puts "done #{beeminder_goals.first}"
# remove this goal from the array as it is done
beeminder_goals.shift

## the other individual Harvest to Beeminder times
count = harvest_clients.count - 1
for i in 0..count
  harvest_time = client_time( harvest_clients[ i ], date )
  update_beeminder_goal( beeminder_goals[ i ], harvest_time, date )
  puts "done #{beeminder_goals[ i ]}"
end
