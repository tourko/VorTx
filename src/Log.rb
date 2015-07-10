#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require 'logger'

# Log module handle logging in the application.
# It uses default Ruby Logger class for logging.
module Log
  @@logger = nil

  #
  # Create a new @@logger or return the existing one
  #
  def Log.create
    @@logger = Logger.new(STDOUT) unless @@logger
    return @@logger
  end

  #
  # Forward all methods called on Log module to @@logger
  #
  def Log.method_missing(name, *args, &block)
    # Use only the first argument and ignore the rest
    message, *ignore = *args
    @@logger.method(name).call(message)
  end

  @@logger = Log.create
end
