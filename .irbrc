begin
  require "rubygems"
  require "pry"
  Pry.start
  exit
rescue LoadError
  puts $!.message
end
