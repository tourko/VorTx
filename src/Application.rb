#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require_relative 'log'

#
# Application class is singleton
#
class Application
  private_class_method :new

  @@application = nil

  #
  # Create Application instance or return the existing one
  #
  def Application.create
    @@application = new.tap do |app|
      Log.debug("Creating new application object")
    end unless @@application

    @@application
  end

  #
  # Run the application
  #
  def run
    Log.debug("Running application")

    while true
      Log.debug("Sleeping for 1 second")
      sleep(1)
    end
  end
end
