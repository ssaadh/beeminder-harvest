# Description: Get the number of hours logged per client for yesterday from HarvestApp.com
# Send times to appropriate Beeminder goals.

require_relative 'base'

require 'harvested'

subdomain = ENV[ 'HARVEST_SUBDOMAIN' ]
username = ENV[ 'HARVEST_USER' ]
password = ENV[ 'HARVEST_PASS' ]

@harvest = Harvest.client( subdomain, username, password )

