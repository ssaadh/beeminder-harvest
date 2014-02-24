# Own code to push Harvest to Beeminder

require_relative 'harvest'

harvest_clients = file_contents( './harvest.txt' )
beeminder_goals = file_contents( './beeminder.txt' )
