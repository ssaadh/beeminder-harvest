require 'beeminder'

@bee = Beeminder::User.new ENV[ 'BEEMINDER_AUTH' ]
