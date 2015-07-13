#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require_relative "application"

if __FILE__ == $0
    app = Application.create
    app.start()
end
