require 'test_helper'

class Badgercap::NginxTest < MiniTest::Unit::TestCase
  def setup
    @config = Capistrano::Configuration.new
    @config.require 'badgercap/capistrano'
    @config.load 'badgercap/nginx'
  end

  def test_nginx_install_task_is_available
    assert_has_task 'nginx:install'
    @config.nginx.install
  end

  def test_nginx_dir
    assert_equal @config.nginx_dir, '/etc/nginx'
    @config.set :nginx_dir, '/blah'
    assert_equal @config.nginx_dir, '/blah'
  end

  def assert_has_task(t)
    assert_includes @config.task_list(:all).map(&:fully_qualified_name), t.to_s
  end
end
