require 'badgercap'
Capistrano::Configuration.instance(true).load do
  load_paths << Badgercap.load_path
end

Capistrano.plugin :badgercap, Badgercap
__END__
# Mostly from http://railscasts.com/episodes/337-capistrano-recipes
    _cset(:packages, %w(nginx monit postgresql)) unless exists? :packages

    namespace :install do
      packages.each do |package|
        desc "Install #{package} on the server"
        task(package) { sudo "apt-get -qy install #{package}" }
        before "install:#{package}", "install:update"
        after "install:#{package}", "#{package}:configure"
        before "deploy:setup", "install:#{package}"
      end

      desc "Update the server's package list"
      task :update do
        unless fetch(:apt_updated, false)
          sudo "apt-get -qq update"
          _cset(:apt_updated, true)
        end
      end
    end

    namespace :nginx do
      _cset(:nginx_dir, "/etc/nginx") unless exists? :nginx_dir
      desc "Configure NginX. Removes the default site and replaces the configuration."
      task :configure do
        sudo "rm -vf #{nginx_dir}/sites-enabled/default"
        template "nginx.conf", "#{nginx_dir}/nginx.conf"
        template "mime.types", "#{nginx_dir}/mime.types"
      end
    end

    namespace :monit do
      _cset(:monit_dir, "/etc/monit") unless exists? :monit
      desc "Configure monit. Replaces the configuration."
      task :configure do
        template "monitrc", "#{monit_dir}/monitrc"
      end
    end

    namespace :postgresql do
      desc "Configure PostgreSQL. Creates the postgresql user, the database, and ensures that it's usable by the app-runner."
      task :configure do
        puts "TODO"
      end
    end

    def template(template, path)
      output = ERB.new(File.read(find_template(template))).result(binding)
      put output, "/tmp/-badger-transfer"
      sudo "mv /tmp/-badger-transfer #{path}"
    end

    def find_template(name)
      File.expand_path("../../../templates/#{name}.erb", __FILE__)
    end
  end
end
