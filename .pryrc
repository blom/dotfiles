begin
  require "rubygems"
  require "awesome_print"
  Pry.config.print = lambda { |output, value| output.puts value.ai }
rescue LoadError
end
