#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require 'logger'

# Log module handle logging in the application.
# It uses default Ruby Logger class for logging.
module Log
  class LogFormater < Logger::Formatter
    def call(severity, time, progname, msg)
      # msg2str is the internal helper that handles different msgs correctly
      "#{time} #{severity} - #{msg2str(msg)}\n"
    end
  end

  @@logger = nil

  #
  # Create a new @@logger or return the existing one
  #
  def Log.create
    #location = caller_locations(1, 1).first
    @@logger = Logger.new(STDOUT).tap do |logger|
      logger.formatter = LogFormater.new
    end unless @@logger

    @@logger
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
