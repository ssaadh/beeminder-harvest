# Description: Get the number of hours logged per client for yesterday from HarvestApp.com
# Send times to appropriate Beeminder goals.

require_relative 'base'
require 'harvested'

subdomain = ENV[ 'HARVEST_SUBDOMAIN' ]
username = ENV[ 'HARVEST_USER' ]
password = ENV[ 'HARVEST_PASS' ]

@harvest = Harvest.client( subdomain, username, password )

## This gets the total time for everything done in Harvest for a particular day.
def total_time( date = nil )
  # Assuming the date is for yesterday (which is a method in base.rb) unless otherwise noted
  date = yesterday if date.nil?
  
  # initialize the variable that will eventually be returned
  total = 0.0
  
  # You would think this should only include the total times of the clients listed in harvest.txt.
  # However that is not how it is right now. This is something that was overlooked, a bug, and a @TODO.
  @harvest.time.all( date ).each do | task_info |
    total += task_info.hours
  end
  
  return total
end

## This gets the total time for a client for a particular day.
def client_time( client_name, date = nil )
  # Assuming the date is for yesterday (which is a method in base.rb) unless otherwise noted
  date = yesterday if date.nil?
  
  # initialize the variable that will eventually be returned
  total = 0.0
  
  @harvest.time.all( date ).each do | task_info |
    # Only add to the total time variable if it matches the specificed client
    if task_info.client == client_name
      total += task_info.hours
    end
  end
  
  return total
end
