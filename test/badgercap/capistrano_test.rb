require 'test_helper'

class BadgercapTest < MiniTest::Unit::TestCase
  def setup
    @config = Capistrano::Configuration.new
  end

  def test_recipies_is_in_the_load_path
    @config.require 'badgercap/capistrano'
    assert_includes @config.load_paths, Badgercap.load_path
  end
end
