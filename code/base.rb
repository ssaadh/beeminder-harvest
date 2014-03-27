require 'dotenv'
Dotenv.load

# Misc
def yesterday
  Time.now - 24 * 60 * 60
end

def file_contents( location )
  an_array = Array.new
  File.open location do | f |    
    f.each_line { | line | an_array.push line.chomp }
  end
  
  return an_array
end
