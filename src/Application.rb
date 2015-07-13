#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require_relative 'log'

#
# Application class is singleton
#
class Application
  private_class_method :new

  @running = false
  @@application = nil

  #
  # Create Application instance or return the existing one
  #
  def Application.create
    @@application = new.tap do |app|
      Log.debug("Creating new application object.")
    end unless @@application

    @@application
  end

  def start
    begin
      if not @runnig
        Log.info("Starting the application.")
        @running = true
        self.run
      end
    rescue Interrupt
      Log.info("Ctrl-C is pressed. Stopping the application.")
      self.stop
    end
  end

  def stop
    if @runnig
      @runnig = false
    end
  end

  #
  # Run the application
  #
  def run
    while @running
      Log.debug("Application is runnig. Sleeping for 15 second.")
      sleep(15)
    end
  end
end
