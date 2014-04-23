require_relative 'base'
require 'beeminder'

@bee = Beeminder::User.new ENV[ 'BEEMINDER_AUTH' ]

## Send to Beeminder
def update_beeminder_goal( goal_name, value, date = nil )
  # Assuming the date is for yesterday (which is a method in base.rb) unless otherwise noted
  date = yesterday if date.nil?
  
  # identify which Beeminder goal to eventually add to
  goal = @bee.goal goal_name
  
  # One of the standard ways in the Beeminder gem to add a datapoint.
  # Adding the value, date, and comment. Goal is not mentioned in the datapoint.
  dp = Beeminder::Datapoint.new value: value, timestamp: date, comment: 'updated using api & code, the update_beeminder_goal method'
  
  # Here is where we add the datapoint to the goal
  goal.add dp
end
