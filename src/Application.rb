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
    @@application = new unless @@application
    return @@application
  end

  #
  # Run the application
  #
  def run
    Log.debug("Running application")
  end
end
