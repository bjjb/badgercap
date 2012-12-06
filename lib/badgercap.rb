require 'capistrano'

module Badgercap
  def self.load_path
    File.expand_path('../../recipes', __FILE__)
  end

  autoload :Nginx, 'badgercap/nginx'
  autoload :Postgresql, 'badgercap/postgresql'
  autoload :Monit, 'badgercap/monit'
end
