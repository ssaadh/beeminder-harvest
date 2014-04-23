require 'dotenv'
Dotenv.load

# quick way to have a time for yesterday.
def yesterday
  Time.now - 24 * 60 * 60
end

# general utility method to read the beeminder.txt and harvest.txt files that have simple single phrases per line
# returns each line from the text file as a single array element
def file_contents( location )
  an_array = Array.new
  File.open location do | f |
    f.each_line { | line | an_array.push line.chomp }
  end
  
  return an_array
end
