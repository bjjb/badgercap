set(:nginx_dir, '/etc/nginx') unless exists? :nginx_dir

namespace :nginx do
  task :install do
    blah.install
  end
end
