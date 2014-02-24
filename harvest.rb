# Description: Get the number of hours logged per client for yesterday from HarvestApp.com
# Send times to appropriate Beeminder goals.

require_relative 'base'

require 'harvested'

subdomain = ENV[ 'HARVEST_SUBDOMAIN' ]
username = ENV[ 'HARVEST_USER' ]
password = ENV[ 'HARVEST_PASS' ]

@harvest = Harvest.client( subdomain, username, password )

# Time for 24 hours ago.
time_to_get = Time.now - 24 * 60 * 60

total_time = 0.0
client_1_time = 0.0
client_2_time = 0.0
client_3_time = 0.0
client_4_time = 0.0


# Get yesterday's number of hours for each client
@harvest.time.all( time_to_get ).each do | daily_project_time |
  total_time += daily_project_time.hours
  
  if daily_project_time.client == 'client 1'
    client_1_time += daily_project_time.hours
  end
  
  if daily_project_time.client == 'client 2'
    client_2_time += daily_project_time.hours
  end
  
  if daily_project_time.client == 'client 3'
    client_3_time += daily_project_time.hours
  end
  
  if daily_project_time.client == 'client 4'
    client_4_time += daily_project_time.hours
  end
end
