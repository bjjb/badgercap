# Badgercap

Some Capistrano recipies for deploying Rails apps to VPSs.

[Home][site] [RDocs][rdoc] [Wiki][wiki] [Gem][gem]

It's called Badgercap because it's amusing to think of a badger wearing a cap.

## Installation

Add this line to your application's Gemfile:

    gem 'badgercap'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install badgercap

## Usage

Badgercap runs on [Capistrano][capistrano]. Common practice is to do everything
in a file called config/deploy.rb file, and you are welcome to do so. I,
however, prefer to keep my deployment configuration in a single Capfile in the
root of the Rails project, require the necessary recipies, and use them there.

So use Badgercap in your deployment script, and run `cap deploy` as usual.

Here's a very simple Capfile sprinkled with Badgercap. It deploys a
[Rails](http://rubyonrails.org/) 3 app called _pilot_ onto one VPS (such as
those provided by [Linode](http://linode.com/)), which is running
[Ubuntu](http://ubuntu.org/) with [Ruby](http://ruby-lang.org/) 1.9.3 via
[RVM](http://rvm.io/), [MySQL](http://www.mysql.com/), serving 3 instances of
the app on [Unicorn](http://unicorn.bogomips.org/) behind a single
[NginX](http://nginx.org/). The Unicorns and NginX are monitored by
[monit](http://mmonit.com/monit/). A user called _deployer_ will deploy the app.

```ruby
# Capfile

load 'deploy' # Loads the default Capistrano deploy tasks
load 'deploy/assets' # if you want to compile assets on the server

# Load only the recipies you need
load 'badgercap/capistrano/ubuntu'
load 'badgercap/capistrano/rvm'
load 'badgercap/capistrano/nginx'
load 'badgercap/capistrano/unicorn'
load 'badgercap/capistrano/postgresql'
load 'badgercap/capistrano/monit'

server "example.com", :app, :web, :db, default: true

```

## Recipes

Badgercap knows about several server tools, all of which are documented
[inline][rdoc] and on the [wiki][wiki].

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[capistrano]: http://github.com/capistrano/capistrano
[wiki]: http://github.com/jjbuckley/badgercap/wiki
[site]: http://jjbuckley.github.com/badgercap
[rdoc]: http://rdoc.info/jjbuckley/badgercap
[gem]: http://rubygems.org/gems/badgercap
