require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
    task :upgrade do
      DataMapper.auto_upgrade!
      puts "Auto-upgrade complete (no data loss)"
    end
  desc "Destructuve upgrade"
    task :migrate do
      DataMapper.auto_migrate!
      puts "Auto-migrate complete (data was lost)"
    end
end