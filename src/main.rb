#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require_relative "Application"

if __FILE__ == $0
    app = Application.create
    app.run()
end
