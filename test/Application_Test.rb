#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require 'test/unit'

class Application_Test < Test::Unit::TestCase
  require 'Application'

  def name
    "Application tests"
  end

  def test_singleton
    app1 = Application.create
    app2 = Application.create

    assert_equal(app1, app2, 'Application object is not a singleton')
  end
end
