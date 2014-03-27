# Description: Get the number of hours logged per client for yesterday from HarvestApp.com
# Send times to appropriate Beeminder goals.

require_relative 'base'
require 'harvested'

subdomain = ENV[ 'HARVEST_SUBDOMAIN' ]
username = ENV[ 'HARVEST_USER' ]
password = ENV[ 'HARVEST_PASS' ]

@harvest = Harvest.client( subdomain, username, password )

def total_time( date = nil )
  date = yesterday if date.nil?
  
  total = 0.0
  @harvest.time.all( date ).each do | task_info |
    total += task_info.hours
  end
  
  return total
end

def client_time( client_name, date = nil )
  date = yesterday if date.nil?
  
  total = 0.0
  @harvest.time.all( date ).each do | task_info |
    if task_info.client == client_name
      total += task_info.hours
    end
  end
  
  return total
end
