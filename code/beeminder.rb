require_relative 'base'
require 'beeminder'

@bee = Beeminder::User.new ENV[ 'BEEMINDER_AUTH' ]

# Send to Beeminder
def update_beeminder_goal( goal_name, value, date = nil )
  date = yesterday if date.nil?
  
  goal = @bee.goal goal_name
  dp = Beeminder::Datapoint.new value: value, timestamp: date, comment: 'updated using api & code, the update_beeminder_goal method'
  goal.add dp
end
