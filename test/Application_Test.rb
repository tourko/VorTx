#
# Copyright © 2015.  Andrey Touró (tourko@gmail.com)
#

require 'minitest/autorun'
require_relative 'environment'

class Application_Test < MiniTest::Test
  def setup
    require 'application'
  end

  def test_singleton
    app1 = Application.create
    app2 = Application.create

    assert_same(app1, app2, 'Application object is not a singleton')
  end
end
